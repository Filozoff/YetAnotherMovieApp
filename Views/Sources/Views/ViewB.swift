import Combine
import SwiftUI

public struct ViewB: View {

	@State private var isActive = false
	@ObservedObject private var viewModel: ViewBViewModel

	public init(viewModel: ViewBViewModel) {
		self.viewModel = viewModel
	}

	public var body: some View {
		Text("Counter: \(viewModel.counter)")
		Button("Bump") {
			viewModel.bump()
		}

		Button("Autobump \(viewModel.isAutobump ? "Stop" : "Start")") {
			viewModel.startStop()
		}

		NavigationLink("go to view C", isActive: $isActive) {
			LazyView(ViewC(viewModel: Factory.make()))
		}
	}
}

struct ViewB_Previews: PreviewProvider {
	static var previews: some View {
		ViewB(viewModel: ViewBViewModel())
	}
}

public class ViewBViewModel: ObservableObject {

	@Published var counter = 0
	@Published var isAutobump = false

	private var cancellables = Set<AnyCancellable>()

	public init() {
		print("B: \(#function)")
	}

	deinit {
		print("B: \(#function)")
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
		Timer.publish(every: 2, on: .main, in: .default)
			.autoconnect()
			.sink { [unowned self] output in
				self.bump()
			}
			.store(in: &cancellables)
	}
}
