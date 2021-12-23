import SwiftUI

public struct ViewWithNavE: View {

	@StateObject private var viewModel: ViewWithNavEViewModel

	public init(viewModel: ViewWithNavEViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		VStack {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}
			Text(viewModel.input)
			TextField("title", text: $viewModel.input)
		}
	}
}

struct ViewWithNavE_Previews: PreviewProvider {

	static var previews: some View {
		ViewWithNavE(viewModel: ViewWithNavEViewModel())
	}
}

public class ViewWithNavEViewModel: ObservableObject {

	let text = "End"
	@Published var input = ""
	@Published var counter = 0

	public init() {
		print("E: \(#function)")
	}

	deinit {
		print("E: \(#function)")
	}

	func bump() {
		counter += 1
	}
}
