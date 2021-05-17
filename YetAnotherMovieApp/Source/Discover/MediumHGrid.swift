//
//  MediumHGrid.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct MediumHGrid: View {

	@State private var width: CGFloat = 0.0

    var body: some View {
		ZStack {
			Color
				.clear
				.bindGeometry(to: $width, reader: { $0.size.width })
				.padding(.horizontal)

			ScrollView(.horizontal) {
				LazyHGrid(rows: [GridItem()], alignment: .top, spacing: Layout.Spacings.small) {
					ForEach(0..<2) { index in
						MediumInfo()
							.frame(width: width)
					}
				}
				.padding(.horizontal)
			}
		}
    }
}

struct MediumHorizontalGrid_Previews: PreviewProvider {

    static var previews: some View {
        MediumHGrid()
			.previewLayout(.sizeThatFits)
    }
}
