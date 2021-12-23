import Combine
import SwiftUI

public struct ViewB: View {

	@StateObject private var viewModel: ViewBViewModel

	public init(viewModel: ViewBViewModel) {
		_viewModel = StateObject(wrappedValue: viewModel)
	}

	public var body: some View {
		let _ = Self._printChanges()

		VStack(spacing: 20.0) {
			Text("Counter: \(viewModel.counter)")
			Button("Bump") {
				viewModel.bump()
			}

			Button("Autobump \(viewModel.isAutobump ? "Stop" : "Start")") {
				viewModel.startStop()
			}

			Button("Go to view C") {
				viewModel.onButtonTap()
			}
		}
	}
}

struct ViewB_Previews: PreviewProvider {
	static var previews: some View {
		ViewB(viewModel: ViewBViewModel(onNext: { }))
	}
}

public class ViewBViewModel: ObservableObject {

	let id = UUID()
	@Published var counter = 0
	@Published var isAutobump = false

	private var onNext: Closure
	private var cancellables = Set<AnyCancellable>()

	public init(onNext: @escaping Closure) {
		self.onNext = onNext
		print("B: \(id) \(#function)")
	}

	deinit {
		print("B: \(id) \(#function)")
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
