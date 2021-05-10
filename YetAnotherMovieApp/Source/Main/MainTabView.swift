//
//  MainTabView.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 10/05/2021.
//

import SwiftUI

struct MainTabView: View {

	@State private var selectedItem: TabItem = .home
	
    var body: some View {
		TabView(selection: $selectedItem) {
			HomeView()
				.tabItem {
					Label("Home", systemImage: selectedItem == .home ? "house.fill" : "house")
				}
				.tag(TabItem.home)

			TopMoviesView()
				.tabItem {
					Label("Home", systemImage: selectedItem == .topMovies ? "star.fill" : "star")
				}
				.tag(TabItem.topMovies)
		}
    }
}

extension MainTabView {

	enum TabItem: Hashable {
		case home
		case topMovies
	}
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
		MainTabView()
			.accentColor(.mvPrimary)
    }
}
