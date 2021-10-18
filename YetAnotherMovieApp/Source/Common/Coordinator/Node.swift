//
//  Node.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/10/2021.
//

import SwiftUI

enum Node<Screen> {
	case push(Screen)
}

extension Node {

	var screen: Screen {
		switch self {
		case .push(let screen): return screen
		}
	}
}

extension Node {

	func transition<B: View, D: View>(
		beginning: B,
		destination: D,
		isActiveBinding: Binding<Bool>
	) -> some ScreenTransition {
		switch self {
		case .push:
			return PushScreenTransition(beginning: beginning, destination: destination, isActive: isActiveBinding)
		}
	}
}
