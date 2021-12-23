import SwiftUI

public struct ViewC: View {

	@StateObject private var viewModel: ViewCViewModel
	
	public init(viewModel: ViewCViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	public var body: some View {
		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}

			Button("Go to view D") {
				viewModel.onButtonTap()
			}
		}
	}
}

struct ViewC_Previews: PreviewProvider {
	static var previews: some View {
		ViewC(viewModel: ViewCViewModel(onNext: { }))
	}
}

public class ViewCViewModel: ObservableObject {
	
	let id = UUID()
	@Published var counter = 0
	
	private var onNext: Closure

	public init(onNext: @escaping Closure) {
		self.onNext = onNext
		print("C: \(id) \(#function)")
	}

	deinit {
		print("C: \(id) \(#function)")
	}

	func onButtonTap() {
		onNext()
	}
	
	func bump() {
		counter += 1
	}
}
