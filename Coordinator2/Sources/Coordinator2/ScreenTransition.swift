import SwiftUI

protocol ScreenTransition: View {
	associatedtype Beginning: View
	associatedtype Destination: View
}
