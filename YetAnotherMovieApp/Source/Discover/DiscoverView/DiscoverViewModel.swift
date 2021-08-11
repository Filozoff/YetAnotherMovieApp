//
//  DiscoverViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import Combine
import Networking

class DiscoverViewModel: ObservableObject {

	@Published var genresViewModel = [String]()
	@Published var popularPeopleViewModel = SmallHGridViewModel(elements: [])
	@Published var trendingMoviesViewModel = MediumHGridViewModel(elements: [])

	@Published private var genres = [GenreDTO]()
	@Published private var movies = [MovieDTO]()
	@Published private var popularPeople = [PersonDTO]()

	private var cancellables = [AnyCancellable]()
	private let networking: MovieNetworking

	init(networking: MovieNetworking) {
		self.networking = networking
		bind()
	}

	private func bind() {
		$genres.map {
			$0.map { $0.name }
		}
		.assign(to: &$genresViewModel)

		$movies.map {
			MediumHGridViewModel(
				elements: $0.map {
					MediumInfoViewModel(
						title: $0.title,
						subtitle: "Rating: \($0.voteAverage)",
						imagePath: $0.posterPath
					)
				}
			)
		}
		.assign(to: &$trendingMoviesViewModel)

		$popularPeople.map {
			SmallHGridViewModel(
				elements: $0.map {
					SmallInfoViewModel(
						title: $0.name,
						subtitle: "Popularity: \($0.popularity)",
						imagePath: $0.profilePath
					)
				}
			)
		}
		.assign(to: &$popularPeopleViewModel)
	}

	func loadData() {
		cancellables.removeAll()
		networking.getGenres()
			.sink(
				receiveCompletion: { completion in
					switch completion {
					case .failure(let error):
						print("Error: \(error)")
					case .finished: break
					}
				},
				receiveValue: { [weak self] in
					self?.genres = $0
				}
			)
			.store(in: &cancellables)

		networking.getTrending(for: .movie, in: .day)
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
			.store(in: &cancellables)

		networking.getPopularPersons()
			.sink(
				receiveCompletion: { completion in
					switch completion {
					case .failure(let error):
						print("Error: \(error)")
					case .finished: break
					}
				},
				receiveValue: { [weak self] in
					self?.popularPeople = $0
				}
			)
			.store(in: &cancellables)
	}
}
