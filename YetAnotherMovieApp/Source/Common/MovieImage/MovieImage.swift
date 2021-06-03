//
//  MovieImage.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 27/05/2021.
//

import Networking
import SwiftUI

struct MovieImage<Placeholder>: View where Placeholder: View {

	@StateObject private var loader: MovieImageLoader
	@State private var size: CGSize = .zero

	private let placeholder: Placeholder

    var body: some View {
		Group {
			if let image = loader.image {
				Image(uiImage: image)
					.resizable()
			} else {
				placeholder
			}
		}
		.bindGeometry(to: $size, reader: { $0.size })
		.onAppear {
			loader.load(for: size)
		}
    }

	init(path: String?, remote: MovieNetworking, @ViewBuilder placeholder: () -> Placeholder) {
		self.placeholder = placeholder()
		_loader = StateObject(wrappedValue: MovieImageLoader(path: path, remote: remote))
	}
}

extension MovieImage {

	init(path: String?, remote: MovieNetworking) where Placeholder == ProgressView<EmptyView, EmptyView> {
		self.init(path: path, remote: remote) {
			ProgressView()
		}
	}
}

struct MovieDBImage_Previews: PreviewProvider {
	
    static var previews: some View {
		MovieImage(path: "/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg", remote: MovieDBNetworking(session: .shared))
			.previewLayout(.fixed(width: 300, height: 300))
    }
}
