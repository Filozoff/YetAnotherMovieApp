import SwiftUI

indirect enum NavigationNode<Screen, V>: View where V: View {
	case view(from: V, to: NavigationNode<Screen, V>, node: Node<Screen>, stack: Binding<[Node<Screen>]>, index: Int)
	case end

	private var isActiveBinding: Binding<Bool> {
		switch self {
		case .end, .view(_, .end, _, _, _):
			return .constant(false)

		case .view(_, .view, _, let stack, let index):
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

		case .view(let view, _, _, _, _):
			view
		}
	}

	@ViewBuilder
	private var toView: some View {
		switch self {
		case .end:
			EmptyView()

		case .view(_, let node, _, _, _):
			node
		}
	}

	var body: some View {
		switch self {
		case .end:
			EmptyView()

		case .view(let from, let to, let node, _, _):
			node.transition(beginning: from, destination: to, isActiveBinding: isActiveBinding)
		}
	}
}
