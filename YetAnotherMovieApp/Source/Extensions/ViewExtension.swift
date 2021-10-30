//
//  ViewExtension.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/05/2021.
//

import SwiftUI

extension View {

	func debug() -> some View {
		print("Debug View: \(self)")
		return self
	}
}

extension View {

	/// Bind any `CGSize` value within a `GeometryProxy`. Big thanks to **Daniel Saidi** and [his article](https://danielsaidi.com/blog/2020/03/25/bind-view-geometry-data-to-bindable-properties).
	/// - Parameters:
	///   - binding: A `CGSize` binding
	///   - reader: A closure that reads from geometry proxy.
	/// - Returns: A `View`.
	func bindGeometry(
		to binding: Binding<CGSize>,
		reader: @escaping (GeometryProxy) -> CGSize) -> some View
	{
		background(GeometryBinding(reader: reader))
			.onPreferenceChange(GeometryPreference.self) { binding.wrappedValue = $0 }
	}
}

private struct GeometryBinding: View {

	let reader: (GeometryProxy) -> CGSize

	var body: some View {
		GeometryReader { geometry in
			Color.clear.preference(
				key: GeometryPreference.self,
				value: reader(geometry)
			)
		}
	}
}

private struct GeometryPreference: PreferenceKey {

	static var defaultValue: CGSize = .zero

	static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
		value = nextValue()
	}
}
