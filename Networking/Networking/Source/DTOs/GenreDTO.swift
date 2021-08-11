//
//  GenreDTO.swift
//  Networking
//
//  Created by Filo on 03/06/2021.
//

import Foundation

public struct GenreDTO: Decodable {

	public let id: Int
	public let name: String

	public init(id: Int, name: String) {
		self.id = id
		self.name = name
	}
}
