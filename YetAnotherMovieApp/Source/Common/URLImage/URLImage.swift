//
//  URLImage.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import SwiftUI

struct URLImage<Placeholder>: View where Placeholder: View {

	@StateObject var loader: ImageLoader

	var body: some View {
		Group {
			if loader.image != nil {
				Image(uiImage: loader.image!)
			} else {
				placeholder
			}
		}
		.onAppear(perform: loader.load)
	}

	private let placeholder: Placeholder

	init(url: URL, session: URLSession = .shared, @ViewBuilder placeholder: () -> Placeholder) {
		self.placeholder = placeholder()
		_loader = StateObject(wrappedValue: ImageLoader(url: url, session: session))
	}
}

struct URLImage_Previews: PreviewProvider {

	private static let url = URL(string: "https://p.kindpng.com/picc/s/81-819387_iron-man-skin-face-iron-man-mask-png.png")!

	static var previews: some View {
		URLImage(url: url) {
			ProgressView(value: 0.3)
				.progressViewStyle(CircularProgressViewStyle())
		}
		.previewLayout(.sizeThatFits)
	}
}
