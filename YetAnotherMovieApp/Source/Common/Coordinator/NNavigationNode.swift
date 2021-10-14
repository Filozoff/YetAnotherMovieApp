//
//  NNavigationNode.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/10/2021.
//

import SwiftUI

indirect enum NNavigationNode<Screen, V: View>: View {
	case view(from: V, to: NNavigationNode<Screen, V>, stack: Binding<[Screen]>, index: Int)
	case end

	private var isActiveBinding: Binding<Bool> {
		switch self {
		case .end, .view(_, .end, _, _):
			return .constant(false)

		case .view(_, .view, let stack, let index):
			return Binding(
				get: {
					return stack.wrappedValue.count > index + 1
				},
				set: { isPushed in
					guard !isPushed else { return }
					guard stack.wrappedValue.count > index + 1 else { return }
					stack.wrappedValue = Array(stack.wrappedValue.prefix(index + 1))
				}
			)
		}
	}

	@ViewBuilder
	private var fromView: some View {
		switch self {
		case .end:
			EmptyView()

		case .view(let view, _, _, _):
			view
		}
	}

	@ViewBuilder
	private var toView: some View {
		switch self {
		case .end:
			EmptyView()

		case .view(_, let node, _, _):
			node
		}
	}

	var body: some View {
		screenTransition(PushScreenTransition(beginning: fromView, destination: toView, isActive: isActiveBinding))
	}
}
