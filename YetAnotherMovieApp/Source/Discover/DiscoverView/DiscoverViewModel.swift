//
//  DiscoverViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import Combine
import Networking

class DiscoverViewModel: ObservableObject {

	@Published var moviesGridViewModel = MediumHGridViewModel(elements: [])

	@Published private var movies: [MovieDTO]?

	private var cancellable: AnyCancellable?
	private let networking: MovieNetworking

	init(networking: MovieNetworking) {
		self.networking = networking
		bind()
	}

	private func bind() {
		$movies.map {
			MediumHGridViewModel(
				elements: $0?.map {
					MediumInfoViewModel(
						title: $0.title,
						subtitle: "Rating: \($0.voteAverage)",
						imagePath: $0.posterPath
					)
				} ?? []
			)
		}
		.assign(to: &$moviesGridViewModel)
	}

	func loadData() {
		cancellable = networking.getTrending(for: .movie, in: .day)
			.sink(
				receiveCompletion: { completion in
					switch completion {
					case .failure(let error):
						print("Error: \(error)")
					case .finished: break
					}
				},
				receiveValue: { [weak self] in
					self?.movies = $0
				}
			)
	}
}
