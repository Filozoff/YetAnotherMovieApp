import SwiftUI

public struct ViewC: View {

	@StateObject private var viewModel = ViewCViewModel()
	let onNext: Closure
	
	public init(onNext: @escaping Closure) {
		self.onNext = onNext
	}
	
	public var body: some View {
		let _ = Self._printChanges()
		
		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}

			Button("Go to view D") {
				viewModel.onButtonTap()
			}
		}
		.onAppear {
			viewModel.onNext = onNext
		}
	}
}

struct ViewC_Previews: PreviewProvider {
	static var previews: some View {
		ViewC(onNext: { })
	}
}

public class ViewCViewModel: ObservableObject {
	
	let id = UUID()
	@Published var counter = 0
	
	fileprivate var onNext: Closure?

	public init() {
		print("C: \(id) \(#function)")
	}

	deinit {
		print("C: \(id) \(#function)")
	}

	func onButtonTap() {
		onNext?()
	}
	
	func bump() {
		counter += 1
	}
}
