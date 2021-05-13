//
//  ViewExtension.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/05/2021.
//

import SwiftUI

extension View {

	/// Bind any `CGFloat` value within a `GeometryProxy`. Big thanks to **Daniel Saidi** and [his article](https://danielsaidi.com/blog/2020/03/25/bind-view-geometry-data-to-bindable-properties).
	/// - Parameters:
	///   - binding: A `CGFloat` binding
	///   - reader: A closure that reads from geometry proxy.
	/// - Returns: A `View`.
	func bindGeometry(
		to binding: Binding<CGFloat>,
		reader: @escaping (GeometryProxy) -> CGFloat) -> some View
	{
		background(GeometryBinding(reader: reader))
			.onPreferenceChange(GeometryPreference.self) { binding.wrappedValue = $0 }
	}
}

private struct GeometryBinding: View {

	let reader: (GeometryProxy) -> CGFloat

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

	static var defaultValue: CGFloat = 0.0

	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = max(value, nextValue())
	}
}
