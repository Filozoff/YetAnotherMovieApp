//
//  Stack.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/10/2021.
//

import SwiftUI

public struct NNStack<Screen, ScreenView: View>: View {

	@Binding var stack: [Screen]
	@ViewBuilder var buildView: (Screen, Int) -> ScreenView

	public init(_ stack: Binding<[Screen]>, @ViewBuilder buildView: @escaping (Screen, Int) -> ScreenView) {
		self._stack = stack
		self.buildView = buildView
	}

	public var body: some View {
		stack
			.enumerated()
			.reversed()
			.reduce(NNavigationNode<Screen, ScreenView>.end) { node, screen in
				.view(
					from: buildView(screen.element, screen.offset),
					to: node,
					stack: $stack,
					index: screen.offset
				)
			}
	}
}

public extension NNStack {

	init(_ stack: Binding<[Screen]>, @ViewBuilder buildView: @escaping (Screen) -> ScreenView) {
		self._stack = stack
		self.buildView = { screen, _ in buildView(screen) }
	}
}
