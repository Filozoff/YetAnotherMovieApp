//
//  MovieImageLoader.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 27/05/2021.
//

import Combine
import Networking
import UIKit

class MovieImageLoader: ObservableObject {

	@Published var image: UIImage?

	private static let imageQueue = DispatchQueue(label: "image queue")

	private let path: String?
	private let remote: MovieNetworking
	private var cancellable: AnyCancellable?

	init(path: String?, remote: MovieNetworking) {
		self.path = path
		self.remote = remote
	}

	func load(for size: CGSize) {
		let pixelWidth = size.width * UIScreen.main.scale
		guard let path = path else { return }
		remote.image(width: Float(pixelWidth), path: path)
			.receive(on: Self.imageQueue)
			.map { UIImage.downsampled(data: $0, size: size) }
			.replaceError(with: nil)
			.receive(on: DispatchQueue.main)
			.assign(to: &$image)
	}
}

extension UIImage {

	static func downsampled(data: Data, size: CGSize) -> UIImage? {
		let imageSourceOptions = [kCGImageSourceShouldCache: false] as CFDictionary
		guard let imageSource = CGImageSourceCreateWithData(data as CFData, imageSourceOptions) else { return nil }
		let pixelSize = CGSize(
			width: size.width * UIScreen.main.scale,
			height: size.height * UIScreen.main.scale
		)

		let maxDimentionInPixels = max(pixelSize.width, pixelSize.height)
		let downsampledOptions = [
			kCGImageSourceCreateThumbnailFromImageAlways: true,
			kCGImageSourceShouldCacheImmediately: true,
			kCGImageSourceCreateThumbnailWithTransform: true,
			kCGImageSourceThumbnailMaxPixelSize: maxDimentionInPixels
		] as CFDictionary

		guard let downsampledImage = CGImageSourceCreateImageAtIndex(imageSource, 0, downsampledOptions) else { return nil }
		return UIImage(cgImage: downsampledImage).downsampled(with: size)
	}

	func downsampled(with size: CGSize) -> UIImage {
		let scale: CGFloat
		if self.size.height > self.size.width {
			scale = size.width / self.size.width
		} else {
			scale = size.height / self.size.height
		}

		let scaledSize = CGSize(
			width: self.size.width * scale,
			height: self.size.height * scale
		)

		let origin = CGPoint(
			x: (size.width - scaledSize.width) / 2,
			y: (size.height - scaledSize.height) / 2
		)

		let renderer = UIGraphicsImageRenderer(size: size)
		return renderer.image { [weak self] context in
			self?.draw(in: CGRect(origin: origin, size: scaledSize))
		}
	}
}
