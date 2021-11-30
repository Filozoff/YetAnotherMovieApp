import SwiftUI

public struct LazyView<Content: View>: View {

	let build: () -> Content

	init(_ build: @autoclosure @escaping () -> Content) {
		self.build = build
	}

	public var body: Content { build() }
}
