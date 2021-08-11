//
//  SectionHeader.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 03/06/2021.
//

import SwiftUI

struct SectionHeader: View {

	let title: String

    var body: some View {
		HStack {
			ZStack {
				VisualEffect()

				Text(title)
					.font(.title2)
					.bold()
					.padding(.all, Layout.Spacings.small)
					.layoutPriority(1)
			}
			.cornerRadius(Layout.CornerRadius.regular)
			.padding(.all, -Layout.Spacings.small)
			.padding([.top, .horizontal])

			Spacer()
		}
    }
}

struct SectionHeader_Previews: PreviewProvider {

    static var previews: some View {
		ForEach(ColorScheme.allCases, id: \.self) {
			SectionHeader(title: "Genre")
				.preferredColorScheme($0)
		}
		.previewLayout(.fixed(width: 300, height: 100))
    }
}
