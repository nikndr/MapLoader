//
//  MapEndPoint.swift
//  MapLoader
//
//  Created by Nikandr Marhal on 09.03.2020.
//  Copyright © 2020 Nikandr Marhal. All rights reserved.
//

import Foundation

enum MapApiBoolean: String {
    case yes, no
}

enum MapApi {
    case downloadMap(standard: MapApiBoolean, file: String)
}

extension MapApi: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "http://download.osmand.net") else {
            fatalError("Base URL is invalid")
        }
        return url
    }

    var path: String {
        switch self {
        case .downloadMap:
            return "download.php"
        }
    }

    var httpMethod: HTTPMethod {
        .get
    }

    var task: HTTPTask {
        switch self {
        case .downloadMap(let standard, let file):
            return .requestParameters(bodyParameters: nil, urlParameters: ["standard": standard, "file": file])
        }
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
