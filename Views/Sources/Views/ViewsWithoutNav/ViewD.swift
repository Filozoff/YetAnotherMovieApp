import SwiftUI

public struct ViewD: View {

	@StateObject private var viewModel: ViewDViewModel
	
	public init(viewModel: ViewDViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}
	
	public var body: some View {
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
	}
}

struct ViewD_Previews: PreviewProvider {
	static var previews: some View {
		ViewD(viewModel: ViewDViewModel(onNext: { _ in }))
	}
}

public class ViewDViewModel: ObservableObject {

	let id = UUID()
	@Published var counter = 0
	
	private var onNext: ValueClosure<Event>

	public init(onNext: @escaping ValueClosure<Event>) {
		self.onNext = onNext
		print("D: \(id) \(#function)")
	}

	deinit {
		print("D: \(id) \(#function)")
	}

	func onNextTap() {
		onNext(.next)
	}

	func onPopTap() {
		onNext(.pop)
	}

	func onPopToRootTap() {
		onNext(.popToRoot)
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
