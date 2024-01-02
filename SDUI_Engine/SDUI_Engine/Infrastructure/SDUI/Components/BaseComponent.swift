//
//  BaseComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

protocol UIDelegate {
    func handleButtonEvent(uid: String)
}

protocol UIComponent {
    var uid: String { get set }
    var children: [UIComponent] { get set }
    var child: UIComponent? { get set }
    func renderUI(delegate: UIDelegate) -> AnyView
}

extension View {
    func toAny() -> AnyView {
        return AnyView(self)
    }
}

struct EmptyComponent: UIComponent {
    var children: [UIComponent] = []
    
    var child: UIComponent? = nil
    
    var uid: String = "empty"
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return EmptyView().toAny()
    }
}
