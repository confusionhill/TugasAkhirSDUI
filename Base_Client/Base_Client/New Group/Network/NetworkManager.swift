//
//  NetworkManager.swift
//  SDUI_Engine
//
//  Created by terminal on 02/01/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
}

final class NetworkManager {
    func get(constant: NetworkConstant) async throws -> Data {
        let req = constant.request
        do {
            let (data, _) = try await URLSession.shared.data(for: req)
            return data
        } catch (let e) {
            throw e
        }
    }
    
    func post(constant: NetworkConstant) async throws -> Data {
        var req = constant.request
        req.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.data(for: req)
            return data
        } catch (let e) {
            throw e
        }
    }
}
