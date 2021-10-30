import SwiftUI

struct ViewFactory {

	static func make(
		number: Int,
		action: @escaping () -> Void = { },
		popAction: @escaping () -> Void = { },
		popToRootAction: @escaping () -> Void = { }
	) -> some View {
		VStack {
			Button("Go to screen \(number + 1)", action: action)
				.padding()

			if number > 0 {
				Button("Previous screen", action: popAction)
					.padding()

				Button("Pop to root", action: popToRootAction)
					.padding()
			}
		}
		.navigationTitle("Screen \(number)")
	}
}
