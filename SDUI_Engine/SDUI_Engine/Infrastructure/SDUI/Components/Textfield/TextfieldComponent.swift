//
//  TextfieldComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 29/11/23.
//

import SwiftUI
import SwiftyJSON

final class TextFieldComponentViewModel: ObservableObject {
    @Published var value: String = ""
}

struct TextfieldComponent: UIComponent {
    var children: [UIComponent] = []
    
    var child: UIComponent? = nil
    
    var uid: String
    let isSecure: Bool
    let title: String
    
    let viewModel = TextFieldComponentViewModel()
    
    init(children: [UIComponent], child: UIComponent? = nil, uid: String, isSecure: Bool, title: String) {
        self.children = children
        self.child = child
        self.uid = uid
        self.isSecure = isSecure
        self.title = title
    }
    
    init(json: JSON) {
        self.uid = json["uid"].stringValue
        self.isSecure = json["is_secure"].boolValue
        self.title = json["title"].stringValue
    }
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return TextfieldView(
            isSecure: isSecure,
            viewModel: self.viewModel,
            title: title
        )
        .toAny()
    }
    
    func getValue() -> String {
        return self.viewModel.value
    }
}

struct TextfieldView: View {
    let isSecure: Bool
    @ObservedObject var viewModel: TextFieldComponentViewModel
    let title: String
    
    var body: some View {
        if isSecure {
            SecureField(title, text: $viewModel.value)
                .padding()
                .background(Color.gray.opacity(0.03))
                .cornerRadius(8)
                .shadow(radius: 0.5)
        } else {
            TextField(title, text: $viewModel.value)
                .padding()
                .background(Color.gray.opacity(0.03))
                .cornerRadius(8)
                .shadow(radius: 0.5)
        }
    }
}
