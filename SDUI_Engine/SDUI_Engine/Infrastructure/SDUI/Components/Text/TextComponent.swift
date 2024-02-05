//
//  TextComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI
import SwiftyJSON

struct TextComponent: UIComponent {
    var children: [UIComponent] = []
    
    var child: UIComponent? = nil
    
    var uid: String
    var message: String
    var size: CGFloat = 20
    
    init(children: [UIComponent], child: UIComponent? = nil, uid: String, message: String, size: CGFloat) {
        self.children = children
        self.child = child
        self.uid = uid
        self.message = message
        self.size = size
    }
    
    init(json: JSON) {
        self.uid = json["uid"].stringValue
        self.message = json["message"].stringValue
        self.size = CGFloat(json["size"].floatValue)
    }
        
    func renderUI(delegate: UIDelegate) -> AnyView {
        return Text(message)
            .font(.system(size: self.size, weight: .bold, design: .rounded))
            .foregroundColor(Color.black)
            .toAny()
    }
}
