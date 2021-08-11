//
//  MovieNetworking.swift
//  Networking
//
//  Created by Filo on 27/05/2021.
//

import Combine

public protocol MovieNetworking {

	func getGenres() -> AnyPublisher<[GenreDTO], Error>
	func getPopularPersons() -> AnyPublisher<[PersonDTO], Error>
	func getTrending(for mediaType: MediaTypeDTO, in timeWindow: TimeWindowDTO) -> AnyPublisher<[MovieDTO], Error>
	func image(width: Float, path: String) -> AnyPublisher<Data, URLSession.DataTaskPublisher.Failure>
}
