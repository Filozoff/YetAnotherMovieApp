//
//  ListElement.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 03/06/2021.
//

import SwiftUI

struct ListElement: View {

	let title: String

	init(title: String) {
		self.title = title
	}

    var body: some View {
        Text(title)
			.font(.title3)
			.bold()
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.vertical, Layout.Spacings.small)
			.padding(.horizontal)
    }
}

struct ListElement_Previews: PreviewProvider {
	
    static var previews: some View {
		ForEach(ColorScheme.allCases, id: \.self) {
			ListElement(title: "Comedy")
				.preferredColorScheme($0)
		}
		.previewLayout(.sizeThatFits)
    }
}
