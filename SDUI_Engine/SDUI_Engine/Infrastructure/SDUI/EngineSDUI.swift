//
//  EngineSDUI.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI
import SwiftyJSON

struct RootElement {
    let title: String
    let header: [UIComponent]
    let body: [UIComponent]
}

final class SDUIEngine {
    
    func render(data: Data) -> RootElement {
        guard let json = try? JSON(data: data) else {
            return RootElement(
                title: "none",
                header: [],
                body: [])
        }
        let title = json["title"].string ?? "none"
        let header = json["header"].array ?? []
        var headerComponent: [UIComponent] = []
        for obj in header {
            headerComponent.append(build(json: obj))
        }
        let body = json["body"].array ?? []
        var bodyComponent: [UIComponent] = []
        for obj in body {
            bodyComponent.append(build(json: obj))
        }
        return RootElement(
            title: title,
            header: headerComponent,
            body: bodyComponent)
    }
    
    private func build(json: JSON) -> UIComponent {
        if let type = json["type"].string, let tnum = ComponentTypes(rawValue: type) {
            let info = json["info"]
            var children: [UIComponent] = []
            switch tnum {
            case .text:
                return TextComponent(json: info)
            case .textField:
                return TextfieldComponent(json: info)
            case .spacer:
                return SpacerComponent(json: info)
            case .button:
                let child = build(json: info["child"])
                return ButtonComponent(info: info, child: child)
            case .stack:
                for obj in info["children"].arrayValue {
                    let child = self.build(json: obj)
                    children.append(child)
                }
                return StackComponent(json: info, children: children)
            case .none:
                return EmptyComponent()
            }
        }
        return EmptyComponent()
    }
}
