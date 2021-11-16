import SwiftUI

struct NStack<Page, PageView>: View where PageView: View {

	@Binding var stack: [Page]
	@ViewBuilder var pageViewBuilder: (Page, Int) -> PageView

	init(_ stack: Binding<[Page]>, @ViewBuilder pageViewBuilder: @escaping (Page, Int) -> PageView) {
		self._stack = stack
		self.pageViewBuilder = pageViewBuilder
	}

	public var body: some View {
		EmptyView()
	}

//	func fold() {
//		combine(
//			previous: combine(
//				previous: combine(
//					previous: (...)
//				)
//			)
//		)
//	}

//	func combine(previous: Previous) -> some View where Previous: View {
//		NodeView(previous: previous, content: <#T##_#>, stack: <#T##Binding<[_]>#>, index: <#T##Int#>)
//	}
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
