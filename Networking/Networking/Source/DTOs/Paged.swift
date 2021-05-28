//
//  Paged.swift
//  Networking
//
//  Created by Filo on 28/05/2021.
//

import Foundation

struct Paged<Element> {

	let page: Int
	let totalPages: Int
	let totalResults: Int
	let results: [Element]
}

extension Paged: Decodable where Element: Decodable { }
