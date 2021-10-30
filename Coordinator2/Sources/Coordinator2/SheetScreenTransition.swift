import SwiftUI

struct SheetScreenTransition<Beginning, Destination>: ScreenTransition where Beginning: View, Destination: View {

	var body: some View {
		beginning
			.sheet(isPresented: $isActive, onDismiss: nil, content: { destination })
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

struct SheetScreenTransition_Previews: PreviewProvider {

	struct SheetScreenTransition_Wrapper: View {

		@State private var isActive = false

		var body: some View {
			SheetScreenTransition(
				beginning: Button("Transition", action: { isActive.toggle() }),
				destination: Text("New view"),
				isActive: $isActive
			)
		}
	}

	static var previews: some View {
		NavigationView {
			SheetScreenTransition_Wrapper()
		}
	}
}
