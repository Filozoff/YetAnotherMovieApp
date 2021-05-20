//
//  MediumHGrid.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct MediumHGrid: View {

	@StateObject private var viewModel = MediumHGridViewModel(
		elements: [
			MediumInfoViewModel(
				title: "League Of Legends: Wild Rift",
				subtitle: "Łowy rozpoczete",
				imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/dd/Big_%26_Small_Pumkins.JPG")!
			),
			MediumInfoViewModel(
				title: "Ghost Rider",
				subtitle: "Spirits of Vengeance wskrzeszone!",
				imageURL: URL(string: "https://heronews.pl/wp-content/uploads/2017/06/ghost-rider-johnny-blaze.jpg")!
			)
		]
	)

	@State private var width: CGFloat = 0.0

    var body: some View {
		ZStack {
			Color
				.clear
				.bindGeometry(to: $width, reader: { $0.size.width })
				.padding(.horizontal)

			ScrollView(.horizontal) {
				LazyHGrid(rows: [GridItem()], alignment: .top, spacing: Layout.Spacings.small) {
					ForEach(viewModel.elements) { element in
						MediumInfo(viewModel: element)
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
