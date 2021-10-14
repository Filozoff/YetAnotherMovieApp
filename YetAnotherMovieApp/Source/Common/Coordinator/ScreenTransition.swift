//
//  ScreenTransition.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 14/10/2021.
//

import SwiftUI

protocol ScreenTransition: View {
	associatedtype Beginning: View
	associatedtype Destination: View
}
