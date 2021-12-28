import Combine
import SwiftUI

public struct ViewA: View {

	@StateObject private var viewModel = ViewAViewModel()
	private let modify: ValueClosure<ViewAViewModel>

	public init(modify: @escaping ValueClosure<ViewAViewModel>) {
		self.modify = modify
	}

	public var body: some View {
		let _ = Self._printChanges()

		NavigationView {
			VStack {
				Button("Go to view B") {
					viewModel.onButtonTap()
				}
			}
		}
		.navigationViewStyle(.stack)
		.onAppear {
			modify(viewModel)
		}
	}
}

public class ViewAViewModel: ObservableObject {

	public var onNext: Closure?

	let id = UUID()
	@Published var counter = 0
	@Published var isAutobump = false

	private var cancellables = Set<AnyCancellable>()

	public init() {
		print("A: \(id) \(#function)")
	}

	deinit {
		print("A: \(id) \(#function)")
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

struct ViewA_Previews: PreviewProvider {
	static var previews: some View {
		ViewA(modify: { _ in })
	}
}
