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

	private let path: String?
	private let remote: MovieNetworking
	private var cancellable: AnyCancellable?

	init(path: String?, remote: MovieNetworking) {
		self.path = path
		self.remote = remote
	}

	func load(for width: Float) {
		guard let path = path else { return }
		remote.image(width: width, path: path)
			.map { UIImage(data: $0) }
			.replaceError(with: nil)
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
			.assign(to: &$image)
	}
}
