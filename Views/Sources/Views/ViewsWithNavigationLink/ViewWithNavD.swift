import SwiftUI

public struct ViewWithNavD: View {

	@State private var isActive = false
	@StateObject private var viewModel: ViewWithNavDViewModel

	public init(viewModel: ViewWithNavDViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		NavigationLink("Go to view E", isActive: $isActive) {
			LazyView(ViewWithNavE(viewModel: Factory.make()))
		}
	}
}

struct ViewWithNavD_Previews: PreviewProvider {
	static var previews: some View {
		ViewWithNavD(viewModel: ViewWithNavDViewModel())
	}
}

public class ViewWithNavDViewModel: ObservableObject {

	@Published var counter = 0

	public init() {
		print("D: \(#function)")
	}

	deinit {
		print("D: \(#function)")
	}

	func bump() {
		counter += 1
	}
}
