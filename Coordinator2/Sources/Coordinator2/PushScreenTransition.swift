import SwiftUI

struct PushScreenTransition<Beginning, Destination>: ScreenTransition where Beginning: View, Destination: View {

	var body: some View {
		beginning
			.background(
				NavigationLink(destination: destination, isActive: $isActive, label: EmptyView.init)
				// NOTE: If this is set to true, there are some unexpected pops when pushing more than 3 screens.
					.isDetailLink(false)
					.hidden()
			)
	}

	@Binding private var isActive: Bool

	private let beginning: Beginning
	private let destination: Destination

	init(beginning: Beginning, destination: Destination, isActive: Binding<Bool>) {
		self.beginning = beginning
		self.destination = destination
		self._isActive = isActive
	}
}

struct PushScreenTransition_Previews: PreviewProvider {

	struct PushScreenTransition_Wrapper: View {

		@State private var isActive = false

		var body: some View {
			PushScreenTransition(
				beginning: Button("Transition", action: { isActive.toggle() }),
				destination: Text("New view"),
				isActive: $isActive
			)
		}
	}

    static var previews: some View {
		NavigationView {
			PushScreenTransition_Wrapper()
		}
    }
}
