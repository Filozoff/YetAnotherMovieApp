//
//  MovieDBNetworking.swift
//  Networking
//
//  Created by Filo on 17/05/2021.
//

import Combine

public class MovieDBNetworking {

	let session: URLSession
	let baseURL: URL

	private(set) var service = MovieDB()

	public init(session: URLSession) {
		self.session = session

		var components = URLComponents()
		components.scheme = service.scheme
		components.host = service.host
		baseURL = components.url!
	}

	public func getTrending(for mediaType: MediaTypeDTO, in timeWindow: TimeWindowDTO) -> AnyPublisher<MovieListDTO, Error> {
		let url = URL(string: "\(baseURL.absoluteString)/\(service.version)/trending/\(mediaType.rawValue)/\(timeWindow.rawValue)")!
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		request.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
		request.setValue("Bearer \(service.apiKey)", forHTTPHeaderField: "Authorization")
		return session.dataTaskPublisher(for: request)
			.map { $0.data }
			.decode(type: MovieListDTO.self, decoder: decoder)
			.eraseToAnyPublisher()
	}
}
