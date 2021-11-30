//
//  RootCoordinator.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 10/05/2021.
//

import Coordinator3
import SwiftUI
import Views

struct RootCoordinator: View {

	@State private var selectedItem: TabItem = .home
	
    var body: some View {
		TabView(selection: $selectedItem) {
			DiscoverView()
				.tabItem {
					Label("Home", systemImage: selectedItem == .home ? "house.fill" : "house")
				}
				.tag(TabItem.home)

			ViewA()
				.tabItem {
					Label("Top movies", systemImage: selectedItem == .topMovies ? "star.fill" : "star")
				}
				.tag(TabItem.topMovies)
		}
    }
}

extension RootCoordinator {

	enum TabItem: Hashable {
		case home
		case topMovies
	}
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
		RootCoordinator()
			.accentColor(.mvPrimary)
    }
}
