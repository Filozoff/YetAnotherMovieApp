//
//  DiscoverView.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 10/05/2021.
//

import SwiftUI

struct DiscoverView: View {
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(
					columns: [GridItem()],
					spacing: Layout.Spacings.small
				) {
					ForEach(0..<30) { index in
						MediumHGrid()
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
