//
//  ImageLoader.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import Combine
import SwiftUI

class ImageLoader: ObservableObject {

	@Published var image: UIImage?

	private let url: URL?
	private let session: URLSession
	private var cancellable: AnyCancellable?

	init(url: URL?, session: URLSession = .shared) {
		self.url = url
		self.session = session
	}

	func load() {
		guard let url = url else { return }
		session.dataTaskPublisher(for: url)
			.map { UIImage(data: $0.data) }
			.replaceError(with: nil)
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
			.assign(to: &$image)
	}
}
