//
//  StackComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI
import SwiftyJSON

struct StackComponent: UIComponent {
    enum StackType: String {
        case vertical, horizontal
    }
    
    var uid: String
    var type: StackType
    var children: [UIComponent]
    var child: UIComponent? = nil
//    let minWidth: CGFloat?
//    let maxWidth: CGFloat?
//    let minHeight: CGFloat?
//    let maxHeight: CGFloat?
//
    init(uid: String, type: StackType, children: [UIComponent], child: UIComponent? = nil) {
        self.uid = uid
        self.type = type
        self.children = children
        self.child = child
    }
    
    init(json: JSON, children: [UIComponent]) {
        self.uid = json["uid"].string ?? UUID().uuidString
        let type = json["type"].string ?? "vertical"
        self.type = StackType(rawValue: type) ?? .vertical
        self.children = children
    }
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        switch self.type {
        case .vertical:
            return VStack(alignment: .leading) {
                ForEach(self.children, id: \.uid) { component in
                    component.renderUI(delegate: delegate)
                }.transition(AnyTransition.scale)
            }
            .toAny()
        case .horizontal:
            return HStack(alignment: .center) {
                ForEach(self.children, id: \.uid) { component in
                    component.renderUI(delegate: delegate)
                }.transition(AnyTransition.scale)
            }
            .padding(.all)
            .background(Color.pink)
            .cornerRadius(10)
            .toAny()
        }
    }
}

