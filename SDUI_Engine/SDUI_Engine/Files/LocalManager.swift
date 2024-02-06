//
//  LocalManager.swift
//  SDUI_Engine
//
//  Created by terminal on 31/01/24.
//

import Foundation

func LoadLocalJSON() -> Data? {
    guard let url = Bundle.main.url(forResource: "example2", withExtension: "json") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        
        return data
    } catch (let err) {
        print(err)
        
        return nil
    }
}
