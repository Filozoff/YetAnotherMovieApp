import Combine
import SwiftUI

public struct ViewA: View {

	@StateObject private var viewModel: ViewAViewModel

	public init(viewModel: ViewAViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		NavigationView {
			VStack {
				Button("Go to view B") {
					viewModel.onButtonTap()
				}
			}
		}
	}
}

public class ViewAViewModel: ObservableObject {

	let id = UUID()
	@Published var counter = 0
	@Published var isAutobump = false

	private var onNext: Closure
	private var cancellables = Set<AnyCancellable>()

	public init(onNext: @escaping Closure) {
		self.onNext = onNext
		print("A: \(id) \(#function)")
	}

	deinit {
		print("A: \(id) \(#function)")
	}

	func onButtonTap() {
		onNext()
	}

	func bump() {
		counter += 1
	}

	func startStop() {
		isAutobump.toggle()
		guard isAutobump else {
			cancellables.removeAll()
			return
		}

		startAutobump()
	}

	func startAutobump() {
		Timer.publish(every: 4, on: .main, in: .default)
			.autoconnect()
			.sink { [unowned self] output in
				self.bump()
			}
			.store(in: &cancellables)
	}
}

struct ViewA_Previews: PreviewProvider {
	static var previews: some View {
		ViewA(viewModel: ViewAViewModel(onNext: { }))
	}
}
