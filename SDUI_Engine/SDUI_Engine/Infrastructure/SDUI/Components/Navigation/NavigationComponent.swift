//
//  NavigationComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 16/11/23.
//

import SwiftUI

struct NavigationComponent: UIComponent {
    var children: [UIComponent] = []
    var uid: String
    var child: UIComponent?
    func renderUI(delegate: UIDelegate) -> AnyView {
        return NavigationComponentView(child: self.child, delegate: delegate).toAny()
    }
}

struct NavigationComponentView: View {
    let child: UIComponent?
    let delegate: UIDelegate
    let to: String = ""
    var body: some View {
        NavigationLink {
            SDUIView(viewModel: .init(to: to))
        } label: {
            child?.renderUI(delegate: delegate)
        }
    }
}
