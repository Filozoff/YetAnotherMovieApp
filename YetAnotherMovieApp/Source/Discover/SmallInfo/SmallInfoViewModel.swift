//
//  SmallInfoViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 28/05/2021.
//

import Foundation

class SmallInfoViewModel: ObservableObject, Identifiable {

	let id = UUID()
	let title: String
	let subtitle: String
	let imagePath: String?

	init(title: String, subtitle: String, imagePath: String?) {
		self.title = title
		self.subtitle = subtitle
		self.imagePath = imagePath
	}
}
