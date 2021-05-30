//
//  ImageSize.swift
//  Networking
//
//  Created by Filo on 27/05/2021.
//

import Foundation

public enum ImageSize: String {

	case w45
	case w154
	case w185
	case w300
	case w780
	case w1280
	case original

	init(width: Float) {
		switch width {
		case 0...45: self = .w45
		case 45...154: self = .w154
		case 154...185: self = .w185
		case 185...300: self = .w300
		case 300...780: self = .w780
		case 720...1280: self = .w1280
		default: self = .original
		}
	}
}
