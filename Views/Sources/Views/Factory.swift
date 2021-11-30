import Foundation

class Factory {

	static func make() -> ViewBViewModel { .init() }
	static func make() -> ViewCViewModel { .init() }
	static func make() -> ViewDViewModel { .init() }
	static func make() -> ViewEViewModel { .init() }
}
