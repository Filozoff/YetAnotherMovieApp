import SwiftUI

public struct ViewWithNavA: View {

	@State private var isActive = false

	public init() { }

	public var body: some View {
		NavigationView {
			VStack {
				NavigationLink("Go to view B", isActive: $isActive) {
					LazyView(ViewWithNavB(viewModel: Factory.make()))
				}
			}
		}
    }
}

struct ViewWithNavA_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithNavA()
    }
}
