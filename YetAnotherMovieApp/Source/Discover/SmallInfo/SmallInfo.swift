//
//  SmallInfo.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 17/05/2021.
//

import SwiftUI

struct SmallInfo: View {

    var body: some View {
		HStack {
			Image("spiderman")
				.resizable()
				.scaledToFill()
				.frame(width: 80, height: 80)
				.clipped()
				.rounded(cornerRadius: Layout.CornerRadius.regular, border: .black.opacity(0.7))

			VStack(alignment: .leading) {
				Text("Spiderman")
					.font(.body)

				Text("Akcja")
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
			
			Spacer()
		}
    }
}

struct SmallInfo_Previews: PreviewProvider {

    static var previews: some View {
        SmallInfo()
			.previewLayout(.sizeThatFits)
    }
}
