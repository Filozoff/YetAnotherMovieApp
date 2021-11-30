import SwiftUI

public struct ViewC: View {

	@State private var isActive = false
	@ObservedObject private var viewModel: ViewCViewModel

	public init(viewModel: ViewCViewModel) {
		self.viewModel = viewModel
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

	@Published var counter = 0

	public init() {
		print("C: \(#function)")
	}

	deinit {
		print("C: \(#function)")
	}

	func bump() {
		counter += 1
	}
}
