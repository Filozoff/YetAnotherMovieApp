//
//  Node.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 12/10/2021.
//

import SwiftUI

public enum Node<Screen> {
	case root(Screen)
	case present(Screen)
	case push(Screen)
}
