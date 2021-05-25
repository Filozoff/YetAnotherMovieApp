//
//  MovieDTO.swift
//  Networking
//
//  Created by Filo on 17/05/2021.
//

import Foundation

public struct MovieDTO: Decodable {

	public let popularity: Double
	public let posterPath: String?
	public let overview: String
	public let title: String
	public let voteAverage: Double

	public init(popularity: Double, posterPath: String?, overview: String, title: String, voteAverage: Double) {
		self.popularity = popularity
		self.posterPath = posterPath
		self.overview = overview
		self.title = title
		self.voteAverage = voteAverage
	}
}
