import Foundation

class Factory {

	static func make() -> ViewWithNavBViewModel { .init() }
	static func make() -> ViewWithNavCViewModel { .init() }
	static func make() -> ViewWithNavDViewModel { .init() }
	static func make() -> ViewWithNavEViewModel { .init() }
}
