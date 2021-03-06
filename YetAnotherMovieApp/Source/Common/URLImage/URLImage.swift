//
//  URLImage.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import SwiftUI

struct URLImage<Placeholder>: View where Placeholder: View {

	@StateObject private var loader: ImageLoader

	var body: some View {
		Group {
			if let image = loader.image {
				Image(uiImage: image)
					.resizable()
			} else {
				placeholder
			}
		}
		.onAppear(perform: loader.load)
	}

	private let placeholder: Placeholder

	init(url: URL?, session: URLSession = .shared, @ViewBuilder placeholder: () -> Placeholder) {
		self.placeholder = placeholder()
		_loader = StateObject(wrappedValue: ImageLoader(url: url, session: session))
	}

	init(urlRequest: URLRequest?, session: URLSession = .shared, @ViewBuilder placeholder: () -> Placeholder) {
		self.placeholder = placeholder()
		_loader = StateObject(wrappedValue: ImageLoader(urlRequest: urlRequest, session: session))
	}
}

extension URLImage {

	init(url: URL?, session: URLSession = .shared) where Placeholder == ProgressView<EmptyView, EmptyView> {
		self.init(url: url, session: session) {
			ProgressView()
		}
	}

	init(urlRequest: URLRequest?, session: URLSession = .shared) where Placeholder == ProgressView<EmptyView, EmptyView> {
		self.init(urlRequest: urlRequest, session: session) {
			ProgressView()
		}
	}
}

struct URLImage_Previews: PreviewProvider {

	private static let url = URL(string: "https://p.kindpng.com/picc/s/81-819387_iron-man-skin-face-iron-man-mask-png.png")!

	static var previews: some View {
		Group {
			URLImage(url: url)
				.previewDisplayName("Default placeholder")
			URLImage(url: url) {
				Text("Loading")
			}
			.previewDisplayName("Custom placeholder")
		}
		.previewLayout(.sizeThatFits)
	}
}
