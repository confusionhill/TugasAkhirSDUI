//
//  TextComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

struct TextComponent: UIComponent {
    var children: [UIComponent] = []
    
    var child: UIComponent? = nil
    
    var uid: String
    var message: String
    var size: CGFloat = 20
        
    func renderUI(delegate: UIDelegate) -> AnyView {
        return Text(message)
            .font(.system(size: self.size, weight: .bold, design: .rounded))
            .foregroundColor(Color.init(hex: "#FFFFFF"))
            .toAny()
    }
}
