import Combine
import SwiftUI

public struct ExampleCoordinator: View {

	@State private var stack: [Screen] = [.home]

	public var body: some View {
		NavigationView {
			NStack($stack) { (page, index) in
				switch page {
				case .home:
					ViewFactory.make(
						number: 0,
						action: { push(screen: .viewOne) }
					)

				case .viewOne:
					ViewFactory.make(
						number: 1,
						action: { push(screen: .viewOne) },
						popAction: { pop() },
						popToRootAction: { popToRoot() }
					)
				}
			}
		}
		.navigationViewStyle(.stack)
	}

	public init() { }

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
	}
}
