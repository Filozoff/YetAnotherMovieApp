import Combine
import SwiftUI

struct NodeView<PreviousNode, Page, Content>: View where PreviousNode: View, Content: View {

    var body: some View {
		VStack {
			previous
				.background(
					NavigationLink(destination: content, isActive: isActiveBinding, label: EmptyView.init)
						.hidden()
				)
		}
    }

	@ViewBuilder private let content: Content
	@ViewBuilder private let previous: PreviousNode

	private var isActiveBinding: Binding<Bool>

	init(
		@ViewBuilder previous: () -> PreviousNode,
		@ViewBuilder content: () -> Content,
		stack: Binding<[Page]>,
		index: Int
	) {
		self.content = content()
		self.previous = previous()

		isActiveBinding = Binding<Bool>(
			get: {
				let isActive = stack.wrappedValue.count > index
				print("GET: ACTIVE: \(isActive), index: \(index)")
				return isActive
			},
			set: { isActive in
				print("SET: ACTIVE: \(isActive), index: \(index), CURRENT: \(stack.wrappedValue)")
				guard !isActive else { return }
				guard stack.wrappedValue.count > index else { return }
				let pages = Array(stack.wrappedValue.prefix(index + 1))
				print("SET: UPDATE: \(pages)")
				stack.wrappedValue = pages
			}
		)
	}
}
