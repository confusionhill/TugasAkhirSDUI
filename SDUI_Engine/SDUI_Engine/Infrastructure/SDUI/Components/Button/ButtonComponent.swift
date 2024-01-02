//
//  ButtonComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

struct ButtonComponent: UIComponent {
    var children: [UIComponent] = []
    
    var uid: String
    var child: UIComponent?
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return Button {
            delegate.handleButtonEvent(uid: self.uid)
        } label: {
            child?.renderUI(delegate: delegate)
        }
        .toAny()
    }
}

struct SimpleButtonComponent: UIComponent {
    var children: [UIComponent] = []
    var child: UIComponent? = nil
    var uid: String
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return Button("hello world") {
            delegate.handleButtonEvent(uid: self.uid)
        }.toAny()
    }
}
