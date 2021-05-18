//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Filo on 17/05/2021.
//

import Combine
import XCTest
@testable import Networking

class NetworkingTests: XCTestCase {

	private var cancellables = [AnyCancellable]()

    func testExample() throws {

		let expectation = self.expectation(description: "completion")
		let movieNetworking = MovieDBNetworking(session: URLSession.shared)
		movieNetworking.getTrending(for: .all, in: .day)
			.sink(receiveCompletion: { completion in
				defer { expectation.fulfill() }
				switch completion {
				case .failure(let error): XCTFail(error.localizedDescription)
				case .finished: return
				}

			}, receiveValue: { values in
				XCTAssertFalse(values.results.isEmpty)
			})
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 5.0)
    }
}
