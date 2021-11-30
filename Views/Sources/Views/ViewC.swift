import SwiftUI

public struct ViewC: View {

	@State private var isActive = false

	// Using `@StateObject` creates a copy of reference type passed through a `init` parameter.
	// That makes child view data safe from parent's updates.
	// On the other hand, updating a child's `viewModel` from parent won't trigger any changes on child.
	@StateObject private var viewModel: ViewCViewModel

	public init(viewModel: ViewCViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		NavigationLink("Go to view D", isActive: $isActive) {
			LazyView(ViewD(viewModel: Factory.make()))
		}
	}
}

struct ViewC_Previews: PreviewProvider {
	static var previews: some View {
		ViewC(viewModel: ViewCViewModel())
	}
}

public class ViewCViewModel: ObservableObject {

	let id = UUID()
	@Published var counter = 0

	public init() {
		print("C: \(id) \(#function)")
	}

	deinit {
		print("C: \(id) \(#function)")
	}

	func bump() {
		counter += 1
	}
}
