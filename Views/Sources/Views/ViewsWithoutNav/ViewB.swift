import Combine
import SwiftUI

public struct ViewB: View {

	@StateObject private var viewModel = ViewBViewModel()
	private let modify: ValueClosure<ViewBViewModel>
	private var isLoaded = false
	private var cancellables = Set<AnyCancellable>()

	public init(modify: @escaping ValueClosure<ViewBViewModel>) {
		self.modify = modify
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
		.onAppear {
			modify(viewModel)
		}
	}
}

struct ViewB_Previews: PreviewProvider {
	static var previews: some View {
		ViewB(modify: { _ in })
	}
}

public class ViewBViewModel: ObservableObject {

	public var onNext: Closure?

	let id = UUID()
	@Published var counter = 0
	@Published var isAutobump = false

	private var cancellables = Set<AnyCancellable>()

	public init() {
		print("B: \(id) \(#function)")
	}

	deinit {
		print("B: \(id) \(#function)")
	}

	func onButtonTap() {
		onNext?()
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
