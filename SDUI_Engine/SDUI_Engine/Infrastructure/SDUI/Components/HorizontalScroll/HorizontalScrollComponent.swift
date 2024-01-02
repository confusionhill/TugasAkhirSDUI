//
//  HorizontalScrollComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 29/11/23.
//

import SwiftUI

struct HorizontalScrollComponent: UIComponent {
    var child: UIComponent? = nil
    var uid: String
    var children: [UIComponent]
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(self.children, id: \.uid) { component in
                    component.renderUI(delegate: delegate)
                }.transition(AnyTransition.scale)
            }
        }.toAny()
    }
    
    
}

