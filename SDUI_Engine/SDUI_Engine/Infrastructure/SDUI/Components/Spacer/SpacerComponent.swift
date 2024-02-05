//
//  SpacerComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI
import SwiftyJSON

struct SpacerComponent: UIComponent {
    var children: [UIComponent] = []
    var child: UIComponent? = nil
    
    var uid: String
    var length: CGFloat?
    
    init(uid: String, length: CGFloat? = nil) {
        self.uid = uid
        self.length = length
    }
    
    init(json: JSON) {
        self.uid = json["uid"].string ?? UUID().uuidString
        if let flt = json["length"].float {
            self.length = CGFloat(flt)
        }
    }
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return Spacer(minLength: self.length).toAny()
    }
    
    
}
