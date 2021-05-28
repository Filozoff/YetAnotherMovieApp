//
//  SmallHGridViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 28/05/2021.
//

import Foundation

class SmallHGridViewModel: ObservableObject {

	let elements: [SmallInfoViewModel]

	init(elements: [SmallInfoViewModel]) {
		self.elements = elements
	}
}
