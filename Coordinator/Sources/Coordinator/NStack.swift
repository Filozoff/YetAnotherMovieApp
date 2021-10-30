import SwiftUI

public struct NStack<Screen, ScreenView: View>: View {

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
			.reduce(NavigationNode<Screen, ScreenView>.end) { pushedNode, new in
				let (index, screen) = new
				return NavigationNode<Screen, ScreenView>.view(
					buildView(screen, index),
					pushing: pushedNode,
					stack: $stack,
					index: index
				)
			}
	}
}

public extension NStack {
	
	init(_ stack: Binding<[Screen]>, @ViewBuilder buildView: @escaping (Screen) -> ScreenView) {
		self._stack = stack
		self.buildView = { screen, _ in buildView(screen) }
	}
}
