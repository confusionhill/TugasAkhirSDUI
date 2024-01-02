//
//  SDUIViewModel.swift
//  SDUI_Engine
//
//  Created by terminal on 16/11/23.
//

import Foundation

protocol SDUIViewModelInterface: AnyObject, ObservableObject {
    var title: String { get set }
    var components: [UIComponent] { get set }
    var navigationBarComponent: [UIComponent] { get set }
    var didAppear: Bool { get set }
    
    func onRefresh()
    func findComponentById(uid: String) -> UIComponent?
    func onDissapear()
    func onAppear()
}

final class SDUIViewModel: SDUIViewModelInterface {
    @Published var title: String = "SDUI View Title"
    @Published var components: [UIComponent] = []
    @Published var navigationBarComponent: [UIComponent] = []
    @Published var didAppear: Bool = false
    let url: String
    
    func onRefresh() {
        self.components = [
            SpacerComponent(uid: "spa1",length: 200),
            TextfieldComponent(uid: "username", isSecure: false, title: "username"),
            TextfieldComponent(uid: "password", isSecure: true, title: "password"),
            SimpleButtonComponent(child: EmptyComponent(), uid: "sign_in_btn"),
            SpacerComponent(uid: "spa2")
        ]
        self.title = "refreshed"
    }
    
    init(to url: String) {
        self.url = url
    }
    
    func findComponentById(uid: String) -> UIComponent? {
        return nil
    }
    
    func onDissapear() {
        self.navigationBarComponent = []
        self.components = []
    }
    
    func onAppear() {
        self.didAppear = true
        self.navigationBarComponent.append(SimpleButtonComponent(child: TextComponent(uid: "d9f8fd", message: "dsf"), uid: "from btn"))
        self.components.append(HorizontalScrollComponent(uid: "Sfa", children: [
            StackComponent(
                uid: "304",
                type: .horizontal,
                children: [
                    StackComponent(
                        uid: "stek",
                        type: .vertical, children: [
                            TextComponent(uid: "dkls", message: "L \(9)"),
                            TextComponent(uid: "dls", message: "k01"),
                        ]),
                    SpacerComponent(uid: "DS"),
                    CircularImageComponent(uid: UUID().uuidString, size: 30)
                ]),
            StackComponent(
                uid: "305",
                type: .horizontal,
                children: [
                    StackComponent(
                        uid: "stek",
                        type: .vertical, children: [
                            TextComponent(uid: "dkls", message: "L \(0)"),
                            TextComponent(uid: "dls", message: "k01"),
                        ]),
                    SpacerComponent(uid: "DS"),
                    CircularImageComponent(uid: UUID().uuidString, size: 30)
                ])
        ]))
        for i in 1...10 {
            self.components.append(ButtonComponent(
                uid: "this_is_button\(i)",
                child: StackComponent(
                    uid: "304",
                    type: .horizontal,
                    children: [
                        StackComponent(
                            uid: "stek",
                            type: .vertical, children: [
                                TextComponent(uid: "dkls", message: "L \(i)"),
                                TextComponent(uid: "dls", message: "k01"),
                            ]),
                        SpacerComponent(uid: "DS"),
                        CircularImageComponent(uid: UUID().uuidString, size: 30)
                    ]))
            )
        }
    }
}
