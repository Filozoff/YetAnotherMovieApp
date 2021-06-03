//
//  SmallHGrid.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 28/05/2021.
//

import SwiftUI

struct SmallHGrid: View {

	@ObservedObject var viewModel: SmallHGridViewModel

	@State private var size: CGSize = .zero

	private let gridItem = GridItem(.fixed(80))

	var body: some View {
		ZStack {
			Color
				.clear
				.bindGeometry(to: $size, reader: { $0.size })
				.padding(.horizontal)

			ScrollView(.horizontal) {
				LazyHGrid(
					rows: Array(repeating: gridItem, count: 3),
					alignment: .top,
					spacing: Layout.Spacings.small
				) {
					ForEach(viewModel.elements) { element in
						SmallInfo(viewModel: element)
							.frame(width: size.width)
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
				title: "How to Lose Friends & Alienate People",
				subtitle: "A British writer struggles to fit in at a high-profile magazine in New York.",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			),
			SmallInfoViewModel(
				title: "Spider-Man: Homecoming",
				subtitle: "Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges.",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			),
			SmallInfoViewModel(
				title: "Fast & Furious Presents: Hobbs & Shaw",
				subtitle: "Ever since US Diplomatic Security Service Agent Hobbs and lawless outcast Shaw first faced off, they just have traded smack talk and body blows.",
				imagePath: "/sd1eByiFLL0arwkip6lV6l25cSj.jpg"
			)
		]
	)
	
    static var previews: some View {
		SmallHGrid(viewModel: previewObject)
			.previewLayout(.sizeThatFits)
    }
}
