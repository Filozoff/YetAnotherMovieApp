import SwiftUI

struct NStack<Page, PageView>: View where PageView: View {

	@Binding private var stack: [Page]
	@ViewBuilder var pageViewBuilder: (Page, Int) -> PageView

	init(_ stack: Binding<[Page]>, @ViewBuilder pageViewBuilder: @escaping (Page, Int) -> PageView) {
		self._stack = stack
		self.pageViewBuilder = pageViewBuilder
	}

	public var body: some View {
		build(number: stack.count)
	}

	func build(number: Int) -> AnyView {
		if number == 1 {
			return AnyView(pageViewBuilder(stack[number - 1], number - 1))
		} else {
			return AnyView(
				NodeView(
					previous: {
						build(number: number - 1)
					},
					content: {
						pageViewBuilder(stack[number - 1], number - 1)
					},
					stack: $stack,
					index: number - 1
				)
			)
		}
	}
}

extension NStack {

	init(_ stack: Binding<[Page]>, @ViewBuilder pageViewBuilder: @escaping (Page) -> PageView) {
		self._stack = stack
		self.pageViewBuilder = { screen, _ in pageViewBuilder(screen) }
	}
}

extension Sequence {

	@inlinable
	public func fold(
		_ nextPartialResult:
		(_ partialResult: Element, _ current: Element) throws -> Element) rethrows
	-> Element? {
		var iterator = makeIterator()
		guard var accumulator = iterator.next() else { return nil }
		while let element = iterator.next() {
			accumulator = try nextPartialResult(accumulator, element)
		}
		return accumulator
	}
}
