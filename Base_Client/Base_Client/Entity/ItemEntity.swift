//
//  ItemEntity.swift
//  Base_Client
//
//  Created by terminal on 10/01/24.
//

import Foundation

struct ItemEntity: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rate: Double
    let count: Int
}
