import Combine
import SwiftUI

public struct ExampleCoordinator: View {

	private var stack: CurrentValueSubject<[Screen], Never> = .init([.home])
	@State private var stack2: [Screen] = [.home]

	public var body: some View {
		NavigationView {
			build(number: stack2.count)
		}
		.navigationViewStyle(.stack)
	}

	public init() { }

	func build(number: Int) -> AnyView {
		AnyView(
			NodeView(
				previous: {
					if number == 1 {
						ViewFactory.make(
							number: 0,
							action: { push(screen: .viewOne) }
						)
					} else {
						build(number: number - 1)
					}
				},
				content: ViewFactory.make(
					number: number,
					action: { push(screen: .viewOne) },
					popAction: { pop() },
					popToRootAction: { popToRoot() }
				),
				stackPublisher: stack,
				index: number
			)
		)
	}

	func pop() {
		var pages = stack.value
		pages = pages.dropLast()
		stack.send(pages)
		stack2 = pages
	}

	func popToRoot() {
		var pages = stack.value
		pages = Array(pages.prefix(1))
		stack.send(pages)
		stack2 = pages
	}

	func push(screen: Screen) {
		var pages = stack.value
		pages.append(screen)
		stack.send(pages)
		stack2.append(screen)
	}

	func present(screen: Screen) {
		var pages = stack.value
		pages.append(screen)
		stack.send(pages)
		stack2.append(screen)
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
