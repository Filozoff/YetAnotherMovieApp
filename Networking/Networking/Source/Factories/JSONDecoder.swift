//
//  JSONDecoder.swift
//  Networking
//
//  Created by Filo on 27/05/2021.
//

import Foundation

extension JSONDecoder {

	enum Factory {

		static func snakeCase() -> JSONDecoder {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			return decoder
		}
	}
}
