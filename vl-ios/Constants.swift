//
//  VLConstants.swift
//  vl-ios
//
//  Created by Abdullah Selek on 25.04.19.
//  Copyright © 2019 VerifID. All rights reserved.
//

enum Timeout {
    static let IntervalForRequest = 10.0
    static let IntervalForResource = 10.0
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]?
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.verifid.app"
        components.path = "/v1" + path
        components.queryItems = queryItems
        return components.url
    }
}
