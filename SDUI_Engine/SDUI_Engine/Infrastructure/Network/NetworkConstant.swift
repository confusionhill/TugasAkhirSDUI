//
//  NetworkConstant.swift
//  SDUI_Engine
//
//  Created by terminal on 02/01/24.
//

import Foundation

enum NetworkConstant {
    case itemList
    case item(id: Int)
    case custom(to: String)
    
    private var baseURL: String {
        "localhost:4389/sdui"
    }
    
    private var url: URL? {
        switch self {
        case .itemList:
            return URL(string: self.baseURL+"/item")
        case .item(let id):
            return URL(string: self.baseURL+"/item/\(id)")
        case .custom(let to):
            return URL(string: to)
        }
    }

}
