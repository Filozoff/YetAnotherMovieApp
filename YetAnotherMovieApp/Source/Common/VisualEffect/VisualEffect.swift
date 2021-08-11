//
//  VisualEffect.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 03/06/2021.
//

import UIKit
import SwiftUI

struct VisualEffect: UIViewRepresentable {

	var effect: UIVisualEffect = UIBlurEffect(style: .prominent)

	func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
	func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct VisualEffect_Previews: PreviewProvider {

    static var previews: some View {
		VisualEffect()
			.previewLayout(.sizeThatFits)
    }
}
