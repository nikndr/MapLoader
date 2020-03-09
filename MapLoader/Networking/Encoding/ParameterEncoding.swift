//
//  ParameterEncoding.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 09.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

enum NetworkError: String, Error {
    case nilParameters = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL was nil."
}
