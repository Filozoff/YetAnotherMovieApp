//
//  MediumInfo.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct MediumInfo: View {

    var body: some View {
		VStack {
			Text("League Of Legends: Wild Rift")
				.font(.title2)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

			Text("Łowy rozpoczete")
				.font(.title3)
				.foregroundColor(.secondary)
				.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

			GeometryReader { reader in
				Image("ironman")
					.resizable()
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
	
    static var previews: some View {
        MediumInfo()
			.frame(width: 350)
			.previewLayout(.sizeThatFits)
    }
}
