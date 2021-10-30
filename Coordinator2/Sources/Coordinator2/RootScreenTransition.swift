import SwiftUI

struct RootScreenTransition<Destination>: ScreenTransition where Destination: View {

	typealias Beginning = Never

    var body: some View { destination }

	private let destination: Destination

	init(destination: Destination) {
		self.destination = destination
	}
}

struct RootScreenTransition_Previews: PreviewProvider {
	
    static var previews: some View {
		RootScreenTransition(destination: Text("foobar"))
    }
}
