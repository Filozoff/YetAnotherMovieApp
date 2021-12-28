import SwiftUI
import Views

public struct ExampleCoordinator: View {

	@State private var stack: [Screen] = [.home]

	public var body: some View {
		NavigationView {
			NStack($stack) { screen, index in
				switch screen {
				case .home:
					LazyView(ViewA(modify: { $0.onNext = { push(screen: .viewOne) }}))

				case .viewOne:
					LazyView(ViewB(modify: { $0.onNext = { push(screen: .viewTwo) }}))

				case .viewTwo:
					LazyView(ViewC(onNext: { push(screen: .viewThree) }))

				case .viewThree:
					LazyView(
						ViewD {
							$0.onNext = { event in
								switch event {
								case .pop: pop()
								case .popToRoot: popToRoot()
								case .next: push(screen: .viewFour)
								}
							}
						}
					)

				case .viewFour:
					ViewE(viewModel: .init())
				}
			}
		}
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
		case viewTwo
		case viewThree
		case viewFour
	}
}

