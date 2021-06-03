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

					Section(
						header: Text("Popular actors")
							.font(.title)
							.bold()
							.frame(maxWidth: .infinity, alignment: .leading)
							.padding([.top, .horizontal])
					) {
						SmallHGrid(viewModel: viewModel.popularPeopleViewModel)
					}
				}
				.padding(.bottom, Layout.Spacings.regular)
			}
			.navigationTitle("Discover")
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
