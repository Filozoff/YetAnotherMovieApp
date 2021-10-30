import SwiftUI

enum Node<Screen> {
	case present(Screen)
	case push(Screen)
	case root(Screen)
}

extension Node {

	var screen: Screen {
		switch self {
		case .present(let screen): return screen
		case .push(let screen): return screen
		case .root(let screen): return screen
		}
	}
}

extension Node {

	@ViewBuilder
	func transition<B: View, D: View>(
		beginning: B,
		destination: D,
		isActiveBinding: Binding<Bool>
	) -> some View {
		switch self {
		case .present:
			SheetScreenTransition(beginning: beginning, destination: destination, isActive: isActiveBinding)
		case .push:
			PushScreenTransition(beginning: beginning, destination: destination, isActive: isActiveBinding)
		case .root:
			RootScreenTransition(destination: destination)
		}
	}
}
