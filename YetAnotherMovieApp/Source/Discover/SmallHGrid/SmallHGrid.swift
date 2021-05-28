//
//  SmallHGrid.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 28/05/2021.
//

import SwiftUI

struct SmallHGrid: View {

	@ObservedObject var viewModel: SmallHGridViewModel

	@State private var width: CGFloat = 0.0

	private let gridItem = GridItem(.fixed(80))

	var body: some View {
		ZStack {
			Color
				.clear
				.bindGeometry(to: $width, reader: { $0.size.width })
				.padding(.horizontal)

			ScrollView(.horizontal) {
				LazyHGrid(
					rows: Array(repeating: gridItem, count: 3),
					alignment: .top,
					spacing: Layout.Spacings.small
				) {
					ForEach(viewModel.elements) { element in
						SmallInfo(viewModel: element)
							.frame(width: width)
					}
				}
				.padding(.horizontal)
			}
		}
	}
}

struct SmallHGrid_Previews: PreviewProvider {

	static let previewObject = SmallHGridViewModel(
		elements: [
			SmallInfoViewModel(
				title: "League Of Legends: Wild Rift",
				subtitle: "Łowy rozpoczete",
				imagePath: "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg"
			),
			SmallInfoViewModel(
				title: "Spider man asda sda sd",
				subtitle: "Spirits of Vengeance wskrzeszone!",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			),
			SmallInfoViewModel(
				title: "Spider man",
				subtitle: "Spirits of Vengeance wskrzeszone!",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			),
			SmallInfoViewModel(
				title: "Spider man",
				subtitle: "Spirits of Vengeance wskrzeszone!",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			)
		]
	)
	
    static var previews: some View {
		SmallHGrid(viewModel: previewObject)
			.previewLayout(.sizeThatFits)
    }
}
