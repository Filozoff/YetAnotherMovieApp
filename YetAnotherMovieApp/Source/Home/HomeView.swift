//
//  HomeView.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 10/05/2021.
//

import SwiftUI

struct HomeView: View {
	
	@State private var width: CGFloat = 0.0
	
	var body: some View {
		NavigationView {
			GeometryReader { mainGeometry in
				ScrollView {
					LazyVGrid(
						columns: [GridItem(.fixed(mainGeometry.size.width))],
						spacing: Layout.Spacings.small
					) {
						ForEach(0..<30) { index in
							ZStack {
								Color
									.clear
									.bindGeometry(to: $width, reader: { $0.size.width })
									.padding(.horizontal)

								ScrollView(.horizontal) {
									LazyHGrid(rows: [GridItem()], spacing: Layout.Spacings.small) {
										ForEach(0..<2) { index in
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
											.frame(width: width)
										}
									}
									.padding(.horizontal)
								}
							}
						}
					}
				}
				.navigationTitle("Home")
			}
		}
	}
}


struct HomeView_Previews: PreviewProvider {
	
	static var previews: some View {
		HomeView()
			.accentColor(.mvPrimary)
	}
}
