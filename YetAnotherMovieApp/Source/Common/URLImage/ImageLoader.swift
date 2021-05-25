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

	private let source: Source
	private let session: URLSession
	private var cancellable: AnyCancellable?

	init(url: URL?, session: URLSession = .shared) {
		self.source = .url(url)
		self.session = session
	}

	init(urlRequest: URLRequest?, session: URLSession = .shared) {
		self.source = .urlRequest(urlRequest)
		self.session = session
	}

	func load() {
		publisher()?
			.map { UIImage(data: $0.data) }
			.replaceError(with: nil)
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
			.assign(to: &$image)
	}

	private func publisher() -> URLSession.DataTaskPublisher? {
		switch source {
		case .url(let url):
			guard let url = url else { return nil }
			return session.dataTaskPublisher(for: url)
		case .urlRequest(let urlRequest):
			guard let urlRequest = urlRequest else { return nil }
			return session.dataTaskPublisher(for: urlRequest)
		}
	}
}

extension ImageLoader {

	enum Source {
		case url(URL?)
		case urlRequest(URLRequest?)
	}
}
