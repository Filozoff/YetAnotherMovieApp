//
//  Rounded.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 13/05/2021.
//

import SwiftUI

struct Rounded: ViewModifier {

	let cornerRadius: CGFloat
	let border: Color
	let lineWidth: CGFloat

	func body(content: Content) -> some View {
		content
			.cornerRadius(cornerRadius)
			.overlay(
				RoundedRectangle(cornerRadius: cornerRadius)
					.strokeBorder(
						border,
						lineWidth: lineWidth,
						antialiased: true
					)
			)
	}
}

extension View {

	func rounded(cornerRadius: CGFloat, border: Color, lineWidth: CGFloat = 1) -> some View {
		modifier(Rounded(cornerRadius: cornerRadius, border: border, lineWidth: lineWidth))
	}
}
