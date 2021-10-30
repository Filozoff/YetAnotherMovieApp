import SwiftUI

extension View {

	func screenTransition<T>(_ transition: T) -> some View where T: ScreenTransition { transition }
}
