//
//  MediumInfoViewModel.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 19/05/2021.
//

import SwiftUI

class MediumInfoViewModel: ObservableObject {

	let title: String
	let subtitle: String
	let imageURL: URL?

	init(title: String, subtitle: String, imageURL: URL?) {
		self.title = title
		self.subtitle = subtitle
		self.imageURL = imageURL
	}
}
