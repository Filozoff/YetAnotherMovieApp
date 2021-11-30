import SwiftUI

public struct ViewD: View {

	@State private var isActive = false
	@StateObject private var viewModel: ViewDViewModel

	public init(viewModel: ViewDViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		NavigationLink("Go to view E", isActive: $isActive) {
			LazyView(ViewE(viewModel: Factory.make()))
		}
	}
}

struct ViewD_Previews: PreviewProvider {
	static var previews: some View {
		ViewD(viewModel: ViewDViewModel())
	}
}

public class ViewDViewModel: ObservableObject {

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
