//
//  TopMoviesCoordinator.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/10/2021.
//

import SwiftUI

struct TopMoviesCoordinator: View {

	@State private var stack: [Screen] = [.home]

	var body: some View {
		NavigationView {
			NStack($stack) { screen, index in
				switch screen {
				case .home:
					ViewFactory.make(
						number: 0,
						action: { push(screen: .viewOne) }
					)

				case .viewOne:
					ViewFactory.make(
						number: 1,
						action: { push(screen: .viewTwo) },
						popAction: { pop() },
						popToRootAction: { popToRoot() }
					)

				case .viewTwo:
					ViewFactory.make(
						number: 2,
						action: { push(screen: .viewThree) },
						popAction: { pop() },
						popToRootAction: { popToRoot() }
					)

				case .viewThree:
					ViewFactory.make(
						number: 3,
						action: { push(screen: .viewFour) },
						popAction: { pop() },
						popToRootAction: { popToRoot() }
					)

				case .viewFour:
					ViewFactory.make(
						number: 4,
						popAction: { pop() },
						popToRootAction: { popToRoot() }
					)
				}
			}
		}
	}

	func pop() {
		stack = stack.dropLast()
	}

	func popToRoot() {
		stack = Array(stack.prefix(1))
	}

	func push(screen: Screen) {
		stack.append(screen)
	}
}

extension TopMoviesCoordinator {

	enum Screen {
		case home
		case viewOne
		case viewTwo
		case viewThree
		case viewFour
	}
}
