//
//  MediumInfo.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct MediumInfo: View {

	@ObservedObject var viewModel: MediumInfoViewModel

    var body: some View {
		VStack {
			Text(viewModel.title)
				.font(.title2)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

			Text(viewModel.subtitle)
				.font(.title3)
				.foregroundColor(.secondary)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

			GeometryReader { reader in
				URLImage(url: viewModel.imageURL)
					.scaledToFill()
					.frame(width: reader.size.width, height: reader.size.height)
					.clipped()
			}
			.aspectRatio(16/9, contentMode: .fit)
			.rounded(cornerRadius: Layout.CornerRadius.regular, border: .black.opacity(0.7))
		}
    }
}

struct MediumInfo_Previews: PreviewProvider {

	static let previewObject = MediumInfoViewModel(
		title: "League Of Legends: Wild Rift",
		subtitle: "Łowy rozpoczete",
		imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/dd/Big_%26_Small_Pumkins.JPG")!
	)
	
    static var previews: some View {
		MediumInfo(viewModel: previewObject)
			.frame(width: 350)
			.previewLayout(.sizeThatFits)
    }
}
