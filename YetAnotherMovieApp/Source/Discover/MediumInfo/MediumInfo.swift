//
//  MediumInfo.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import Networking
import SwiftUI

struct MediumInfo: View {

	@ObservedObject var viewModel: MediumInfoViewModel

    var body: some View {
		VStack {
			Text(viewModel.title)
				.font(.title2)
				.frame(maxWidth: .infinity, alignment: .leading)
				.lineLimit(1)

			Text(viewModel.subtitle)
				.font(.title3)
				.foregroundColor(.secondary)
				.frame(maxWidth: .infinity, alignment: .leading)
				.lineLimit(1)

			GeometryReader { reader in
				MovieImage(path: viewModel.imagePath, remote: MovieDBNetworking(session: .shared))
					.scaledToFill()
					.frame(width: reader.size.width, height: reader.size.height)
					.clipped()
			}
			.aspectRatio(16/9, contentMode: .fit)
			.rounded(cornerRadius: Layout.CornerRadius.regular, border: .mvTertiaryBackground.opacity(0.1))
		}
    }
}

struct MediumInfo_Previews: PreviewProvider {

	static let previewObject = MediumInfoViewModel(
		title: "League Of Legends: Wild Rift",
		subtitle: "Łowy rozpoczete",
		imagePath: "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
	)

	static var previews: some View {
		ForEach(ColorScheme.allCases, id: \.self) {
			MediumInfo(viewModel: previewObject)
				.preferredColorScheme($0)
		}
		.frame(width: 350)
		.previewLayout(.sizeThatFits)
	}
}
