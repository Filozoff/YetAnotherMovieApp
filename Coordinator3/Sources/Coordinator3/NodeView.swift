import SwiftUI

public protocol NodeProtocol: View { }
extension EmptyView: NodeProtocol { }

struct NodeView<PreviousNode, Page, Content>: View where PreviousNode: View, Content: View {

    var body: some View {
		VStack {
			previous
				.background(
					NavigationLink(destination: content, isActive: $isActiveBinding, label: EmptyView.init)
						.hidden()
				)

			Button("next", action: {
				isActiveBinding = true
			})
		}
    }

	@State private var isActiveBinding = false
	private let content: Content
	private let index: Int
	private let previous: PreviousNode
	@Binding private var stack: [Page]

	init(@ViewBuilder previous: () -> PreviousNode, content: Content, stack: Binding<[Page]>, index: Int) {
		self.index = index
		self.content = content
		self.previous = previous()

		_stack = stack
	}
}
