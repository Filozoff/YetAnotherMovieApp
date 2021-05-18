//
//  MovieListDTO.swift
//  Networking
//
//  Created by Filo on 17/05/2021.
//

import Foundation

public struct MovieListDTO: Decodable {

	public let page: Int
	public let results: [MovieDTO]
	public let totalPages: Int
	public let totalResults: Int

	public init(page: Int, results: [MovieDTO], totalPages: Int, totalResults: Int) {
		self.page = page
		self.results = results
		self.totalPages = totalPages
		self.totalResults = totalResults
	}
}
