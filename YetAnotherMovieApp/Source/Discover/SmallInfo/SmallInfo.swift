//
//  SmallInfo.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 17/05/2021.
//

import Networking
import SwiftUI

struct SmallInfo: View {

	@ObservedObject var viewModel: SmallInfoViewModel

    var body: some View {
		HStack(spacing: Layout.Spacings.small) {
			MovieImage(path: viewModel.imagePath, remote: MovieDBNetworking(session: .shared))
				.scaledToFill()
				.frame(width: 80, height: 80)
				.clipped()
				.rounded(cornerRadius: Layout.CornerRadius.regular, border: .mvTertiaryBackground.opacity(0.1))

			VStack(alignment: .leading) {
				Text(viewModel.title)
					.font(.body)
					.lineLimit(2)
					.layoutPriority(1)

				Text(viewModel.subtitle)
					.font(.subheadline)
					.foregroundColor(.secondary)
					.lineLimit(2)
			}
			
			Spacer()
		}
    }
}

struct SmallInfo_Previews: PreviewProvider {

	static let previewObject = SmallInfoViewModel(
		title: "League Of Legends: Wild Rift",
		subtitle: "Łowy rozpoczete",
		imagePath: "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
	)

    static var previews: some View {
		ForEach(ColorScheme.allCases, id: \.self) {
			SmallInfo(viewModel: previewObject)
				.preferredColorScheme($0)
		}
		.previewLayout(.sizeThatFits)
    }
}
