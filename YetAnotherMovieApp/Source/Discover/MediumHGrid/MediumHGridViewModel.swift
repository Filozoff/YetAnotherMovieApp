//
//  MediumHGridViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 20/05/2021.
//

import Foundation

class MediumHGridViewModel: ObservableObject {

	let elements: [MediumInfoViewModel]

	init(elements: [MediumInfoViewModel]) {
		self.elements = elements
	}
}
