import SwiftUI

public struct ViewE: View {

	@StateObject private var viewModel: ViewEViewModel

	public init(viewModel: ViewEViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		let _ = Self._printChanges()
		
		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}
			
			Text(viewModel.input)
			TextField("title", text: $viewModel.input)
		}
	}
}

struct ViewE_Previews: PreviewProvider {

	static var previews: some View {
		ViewE(viewModel: ViewEViewModel())
	}
}

public class ViewEViewModel: ObservableObject {

	let id = UUID()
	let text = "End"
	@Published var input = ""
	@Published var counter = 0

	public init() {
		print("E: \(id) \(#function)")
	}

	deinit {
		print("E: \(id) \(#function)")
	}

	func bump() {
		counter += 1
	}
}
