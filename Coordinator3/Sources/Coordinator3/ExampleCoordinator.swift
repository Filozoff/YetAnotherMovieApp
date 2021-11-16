import SwiftUI

public struct ExampleCoordinator: View {

	@State private var stack: [Screen] = [.home]

	public var body: some View {
		NavigationView {
			build(number: stack.count)
		}
		.navigationViewStyle(.stack)
	}

	public init() { }

	func build(number: Int) -> some View {
		NodeView(
			previous: {
				if number == 1 {
					ViewFactory.make(
						number: 0,
						action: {
							push(screen: .viewOne)
						},
						popAction: { pop() },
						popToRootAction: { popToRoot() }
					)
				} else {
					AnyView(build(number: number - 1))
				}
			},
			content: ViewFactory.make(
				number: number,
				action: {
					push(screen: .viewOne)
				},
				popAction: { pop() },
				popToRootAction: { popToRoot() }
			),
			stack: $stack,
			index: number
		)
	}

	func pop() {
		stack = stack.dropLast()
	}

	func popToRoot() {
		stack = Array(stack.prefix(1))
	}

	func push(screen: Screen) {
		stack.append(screen)
	}

	func present(screen: Screen) {
		stack.append(screen)
	}
}

extension ExampleCoordinator {

	enum Screen {
		case home
		case viewOne
		case viewTwo
		case viewThree
		case viewFour
	}
}
