//
//  DiscoverView.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 10/05/2021.
//

import SwiftUI

struct DiscoverView: View {

	@State private var width: CGFloat = 0.0
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(
					columns: [GridItem()],
					spacing: Layout.Spacings.small
				) {
					MediumHGrid()

					ZStack {
						Color
							.clear
							.bindGeometry(to: $width, reader: { $0.size.width })
							.padding(.horizontal)

						ScrollView(.horizontal) {
							LazyHGrid(
								rows: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80))],
								spacing: Layout.Spacings.small
							) {
								ForEach(0..<12) { index in
									SmallInfo()
										.frame(width: width)
								}
							}
							.padding(.horizontal)
						}
					}
				}
			}
			.navigationTitle("Discover")
		}
	}
}


struct HomeView_Previews: PreviewProvider {
	
	static var previews: some View {
		DiscoverView()
			.accentColor(.mvPrimary)
	}
}
