import SwiftUI

public struct ViewD: View {

	@StateObject private var viewModel = ViewDViewModel()
	private let modify: ValueClosure<ViewDViewModel>
	
	public init(modify: @escaping ValueClosure<ViewDViewModel>) {
		self.modify = modify
	}
	
	public var body: some View {
		let _ = Self._printChanges()
		
		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}

			Button("Pop") {
				viewModel.onPopTap()
			}

			Button("Pop to root") {
				viewModel.onPopToRootTap()
			}

			Button("Go to view E") {
				viewModel.onNextTap()
			}
		}
		.onAppear {
			modify(viewModel)
		}
	}
}

struct ViewD_Previews: PreviewProvider {
	static var previews: some View {
		ViewD(modify: { _ in })
	}
}

public class ViewDViewModel: ObservableObject {

	let id = UUID()
	@Published var counter = 0

	public var onNext: ValueClosure<Event>?

	public init() {
		print("D: \(id) \(#function)")
	}

	deinit {
		print("D: \(id) \(#function)")
	}

	func onNextTap() {
		onNext?(.next)
	}

	func onPopTap() {
		onNext?(.pop)
	}

	func onPopToRootTap() {
		onNext?(.popToRoot)
	}
	
	func bump() {
		counter += 1
	}
}

extension ViewDViewModel {

	public enum Event {
		case next
		case pop
		case popToRoot
	}
}
