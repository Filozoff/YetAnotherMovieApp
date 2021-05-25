//
//  ImageSize.swift
//  Networking
//
//  Created by Filo on 27/05/2021.
//

import Foundation

public enum ImageSize {

	case backdrop(Backdrop)
	case profile(Profile)

	var rawValue: String {
		switch self {
		case .backdrop(let size): return size.rawValue
		case .profile(let size): return size.rawValue
		}
	}

	init(width: Float) {
		switch width {
		case 0...45: self = .profile(.small)
		case 45...185: self = .profile(.medium)
		case 185...300: self = .backdrop(.small)
		case 300...780: self = .backdrop(.medium)
		case 720...1280: self = .backdrop(.big)
		default: self = .backdrop(.original)
		}
	}
}

extension ImageSize {

	public enum Backdrop: String {

		case small = "w300"
		case medium = "w780"
		case big = "w1280"
		case original
	}

	public enum Profile: String {

		case small = "w45"
		case medium = "w185"
	}
}
