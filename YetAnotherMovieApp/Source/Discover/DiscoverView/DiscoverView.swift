//
//  DiscoverView.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 10/05/2021.
//

import Networking
import SwiftUI

struct DiscoverView: View {

	@StateObject private var viewModel = DiscoverViewModel(networking: MovieDBNetworking(session: .shared))
	
	@State private var width: CGFloat = 0.0
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(
					columns: [GridItem()],
					spacing: Layout.Spacings.small,
					pinnedViews: .sectionHeaders
				) {
					Section {
						MediumHGrid(viewModel: viewModel.trendingMoviesViewModel)
					}

					Section(header: SectionHeader(title: "Popular actors")) {
						SmallHGrid(viewModel: viewModel.popularPeopleViewModel)
					}

					Section(header: SectionHeader(title: "Genres")) {
						ForEach(viewModel.genresViewModel, id: \.self) {
							ListElement(title: $0)
						}
					}
				}
				.padding(.bottom, Layout.Spacings.regular)
			}
			.navigationTitle("Discover")
			.navigationViewStyle(.stack)
			.onAppear {
				viewModel.loadData()
			}
		}
	}
}


struct HomeView_Previews: PreviewProvider {
	
	static var previews: some View {
		DiscoverView()
			.accentColor(.mvPrimary)
	}
}
