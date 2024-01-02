//
//  TextfieldComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 29/11/23.
//

import SwiftUI

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
