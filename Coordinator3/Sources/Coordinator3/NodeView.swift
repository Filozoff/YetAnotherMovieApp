import Combine
import SwiftUI

public protocol NodeProtocol: View { }
extension EmptyView: NodeProtocol { }

struct NodeView<PreviousNode, Page, Content>: View where PreviousNode: View, Content: View {

    var body: some View {
		VStack {
			previous
				.background(
					NavigationLink(destination: content, isActive: observer.isActiveBinding, label: EmptyView.init)
						.hidden()
				)
		}
    }

	@ViewBuilder private let content: Content
	@ViewBuilder private let previous: PreviousNode
	@StateObject private var observer: StackObserver<Page>

	init(@ViewBuilder previous: () -> PreviousNode, content: Content, stackPublisher: CurrentValueSubject<[Page], Never>, index: Int) {
		self.content = content
		self.previous = previous()
		_observer = StateObject(wrappedValue: .init(stackPublisher: stackPublisher, index: index))
	}
}

class StackObserver<Page>: ObservableObject {

	var isActiveBinding: Binding<Bool>

	private let index: Int
	@Published private var pages = [Page]()

	init(stackPublisher: CurrentValueSubject<[Page], Never>, index: Int) {
		self.index = index

		isActiveBinding = Binding<Bool>(
			get: { stackPublisher.value.count > index },
			set: { isActive in
				guard !isActive else { return }
				guard stackPublisher.value.count > index else { return }
				let pages = Array(stackPublisher.value.prefix(index + 1))
				print(pages)
				stackPublisher.send(pages)
			}
		)

		stackPublisher
			.assign(to: &$pages)
	}
}
