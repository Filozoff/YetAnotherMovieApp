//
//  MovieDBNetworking.swift
//  Networking
//
//  Created by Filo on 17/05/2021.
//

import Combine

public class MovieDBNetworking: MovieNetworking {
	
	let session: URLSession

	private let service = MovieDB()

	public init(session: URLSession) {
		self.session = session
	}

	public func getPopularPersons() -> AnyPublisher<[PersonDTO], Error> {
		guard let url = URL(string: "\(service.base)/person/popular") else { fatalError() }
		var request = service.applyCommonHeaders(to: URLRequest(url: url))
		request.httpMethod = "GET"
		return session.dataTaskPublisher(for: request)
			.map { $0.data }
			.decode(type: Paged<PersonDTO>.self, decoder: JSONDecoder.Factory.snakeCase())
			.map { $0.results }
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}

	public func getTrending(for mediaType: MediaTypeDTO, in timeWindow: TimeWindowDTO) -> AnyPublisher<[MovieDTO], Error> {
		guard let url = URL(string: "\(service.base)/trending/\(mediaType.rawValue)/\(timeWindow.rawValue)") else { fatalError() }
		var request = service.applyCommonHeaders(to: URLRequest(url: url))
		request.httpMethod = "GET"
		return session.dataTaskPublisher(for: request)
			.map { $0.data }
			.decode(type: Paged<MovieDTO>.self, decoder: JSONDecoder.Factory.snakeCase())
			.map { $0.results }
			.receive(on: RunLoop.main)
			.eraseToAnyPublisher()
	}

	public func image(width: Float, path: String) -> AnyPublisher<Data, URLSession.DataTaskPublisher.Failure> {
		let imageSize = ImageSize(width: width)
		guard let url = URL(string: "\(service.baseImage)/\(imageSize.rawValue)\(path)") else { fatalError() }
		var request = service.applyCommonHeaders(to: URLRequest(url: url))
		request.httpMethod = "GET"
		return session.dataTaskPublisher(for: request)
			.map { $0.data }
			.eraseToAnyPublisher()
	}
}
