//
//  NetworkManager.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 09.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import Foundation

struct NetworkManager {
    private let router = Router<MapApi>()
    let result: Result<String>
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

enum NetworkResponse: String, Error {
    case success
    case authenticationError = "Authentication error"
    case badRequest = "Bad request"
    case outdated = "The URL is outdated"
    case failed = "Request failed"
    case noData = "Response returned with no data"
    case unableToDecoda = "Could not decode the response"
}

enum Result<String> {
    case success
    case failure(String)
}
