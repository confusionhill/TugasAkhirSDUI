//
//  EngineSDUI.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

final class SDUIEngine {
    func render(_ components: [any UIComponent], uiDelegate: UIDelegate) -> AnyView {
        return ScrollView(.vertical) {
            
        }.toAny()
    }
}
