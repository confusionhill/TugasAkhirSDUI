//
//  NetworkManager.swift
//  SDUI_Engine
//
//  Created by terminal on 02/01/24.
//

import Foundation

final class NetworkManager {
    public static let shared = NetworkManager()
    private var secretKey = ""
    
    public func setSecretKey(key: String) {
        self.secretKey = key
    }
    
    public func fetch(type: NetworkConstant) {
        
    }
}
