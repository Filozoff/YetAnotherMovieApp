//
//  Stack.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/10/2021.
//

import SwiftUI

struct NNStack<Screen, ScreenView: View>: View {

	@Binding var stack: [Node<Screen>]
	@ViewBuilder var buildView: (Screen, Int) -> ScreenView

	init(_ stack: Binding<[Node<Screen>]>, @ViewBuilder buildView: @escaping (Screen, Int) -> ScreenView) {
		self._stack = stack
		self.buildView = buildView
	}

	public var body: some View {
		stack
			.enumerated()
			.reversed()
			.reduce(NNavigationNode<Screen, ScreenView>.end) { nnode, node in
				.view(
					from: buildView(node.element.screen, node.offset),
					to: nnode,
					node: node.element,
					stack: $stack,
					index: node.offset
				)
			}
	}
}

extension NNStack {

	init(_ stack: Binding<[Node<Screen>]>, @ViewBuilder buildView: @escaping (Screen) -> ScreenView) {
		self._stack = stack
		self.buildView = { screen, _ in buildView(screen) }
	}
}
