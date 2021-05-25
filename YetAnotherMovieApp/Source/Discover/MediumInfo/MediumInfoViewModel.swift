//
//  MediumInfoViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import Foundation

class MediumInfoViewModel: ObservableObject, Identifiable {

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
