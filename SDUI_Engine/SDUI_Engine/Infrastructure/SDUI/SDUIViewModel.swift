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
    
    let url: String
    
    func onRefresh() {
        
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
        if let data = LoadLocalJSON() {
            let compo = engine.render(data: data)
            
            self.components = compo
        }
        self.didAppear = true
    }
}
