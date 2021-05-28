//
//  PersonDTO.swift
//  Networking
//
//  Created by Filo on 28/05/2021.
//

import Foundation

public struct PersonDTO: Decodable {

	public let name: String
	public let popularity: Float
	public let profilePath: String?

	public init(name: String, popularity: Float, profilePath: String) {
		self.name = name
		self.popularity = popularity
		self.profilePath = profilePath
	}
}
