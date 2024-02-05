//
//  ButtonComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI
import SwiftyJSON

struct ButtonComponent: UIComponent {
    var children: [UIComponent] = []
    
    var uid: String
    var child: UIComponent?
    
    init(children: [UIComponent], uid: String, child: UIComponent? = nil) {
        self.children = children
        self.uid = uid
        self.child = child
    }
    
    init(info: JSON, child: UIComponent) {
        self.uid = info["uid"].stringValue
        self.child = child
    }
    
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
