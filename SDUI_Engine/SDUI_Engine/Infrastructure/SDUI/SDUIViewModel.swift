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
    
    private let engine = SDUIEngine()
    private let network = NetworkManager.shared
    
    let constant: NetworkConstant
    
    func onRefresh() {
        
    }
    
    init(to url: String) {
        self.constant = NetworkConstant.custom(to: url)
    }
    
    init(constant: NetworkConstant) {
        self.constant = constant
    }
    
    func findComponentById(uid: String) -> UIComponent? {
        return nil
    }
    
    func onDissapear() {
        self.navigationBarComponent = []
        self.components = []
    }
    
    func onAppear() {
//        network.fetch(type: self.constant)
        if let data = LoadLocalJSON() {
            let root = engine.render(data: data)
            self.title = root.title
            self.navigationBarComponent = root.header
            self.components = root.body
        }
        self.didAppear = true
    }
}
