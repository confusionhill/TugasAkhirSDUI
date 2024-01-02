//
//  SpacerComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

struct SpacerComponent: UIComponent {
    var children: [UIComponent] = []
    var child: UIComponent? = nil
    
    var uid: String
    var length: CGFloat?
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return Spacer(minLength: self.length).toAny()
    }
    
    
}
