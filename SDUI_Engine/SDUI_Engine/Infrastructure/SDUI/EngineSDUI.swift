//
//  EngineSDUI.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI
import SwiftyJSON

final class SDUIEngine {
    
    func render(data: Data) -> [UIComponent] {
        var components: [UIComponent] = []
        guard let json = try? JSON(data: data) else {
            return components
        }
        for obj in json.arrayValue {
            components.append(build(json: obj))
        }
        return components
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
