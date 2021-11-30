import SwiftUI

public struct ViewA: View {

	@State private var isActive = false

	public init() { }

	public var body: some View {
		NavigationView {
			VStack {
				NavigationLink("Go to view B", isActive: $isActive) {
					ViewB(viewModel: Factory.make())
				}
			}
		}
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
