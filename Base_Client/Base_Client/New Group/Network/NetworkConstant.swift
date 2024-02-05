//
//  NetworkConstant.swift
//  SDUI_Engine
//
//  Created by terminal on 02/01/24.
//

import Foundation

enum NetworkConstant {
    case item(id: Int)
    case items(page: Int = 1, limit: Int = 10)
    case custom(to: String)
    
    private var baseURL: String {
        "localhost:4389/base"
    }
    
    private var url: URL? {
        switch self {
        case .item(let id):
            return URL(string: self.baseURL+"/item/\(id)")
        case .custom(let to):
            return URL(string: to)
        case .items(page: let page, limit: let limit):
            return URL(string: self.baseURL+"/item?page=\(page)&limit=\(limit)")
        }
    }
    
    public var request: URLRequest {
        return URLRequest(url: self.url!)
    }

}
