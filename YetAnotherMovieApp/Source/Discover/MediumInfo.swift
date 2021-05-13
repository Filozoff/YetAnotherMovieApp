//
//  MediumInfo.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct MediumInfo: View {

    var body: some View {
		VStack(alignment: .leading) {
			Text("League Of Legends: Wild Rift")
				.font(.title2)

			Text("Łowy rozpoczete")
				.font(.title3)
				.foregroundColor(.secondary)

			Image("spiderman")
				.resizable()
				.scaledToFill()
				.aspectRatio(16/9, contentMode: .fill)
				.cornerRadius(Layout.CornerRadius.regular)
				.overlay(
					RoundedRectangle(cornerRadius: Layout.CornerRadius.regular)
						.strokeBorder(
							Color.black.opacity(0.7),
							lineWidth: 1.0,
							antialiased: true
						)
				)
		}
    }
}

struct MediumInfo_Previews: PreviewProvider {
	
    static var previews: some View {
        MediumInfo()
			.frame(height: 250)
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
