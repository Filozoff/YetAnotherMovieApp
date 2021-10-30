//
//  NodeView.swift
//  YetAnotherMovieApp
//
//  Created by Filo on 30/10/2021.
//

import SwiftUI

protocol NodeProtocol: View { }

struct NodeView<PreviousNode, Page, Content>: NodeProtocol where PreviousNode: NodeProtocol, Content: View {

    var body: some View {
		EmptyView()
    }

	private var isActiveBinding: Binding<Bool> {
		.init(
			get: { stack.wrappedValue.count > index + 1 },
			set: { isPushed in
				guard !isPushed else { return }
				guard stack.wrappedValue.count > index + 1 else { return }
				stack.wrappedValue = Array(stack.wrappedValue.prefix(index + 1))
			}
		)
	}

	private let stack: Binding<[Page]>
	private let index: Int

	init(previous: PreviousNode, content: Content, stack: Binding<[Page]>, index: Int) {
		self.stack = stack
		self.index = index
	}
}
