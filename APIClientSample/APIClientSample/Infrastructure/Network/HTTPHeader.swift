//
//  HTTPHeader.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

public struct HTTPHeaders {
    private(set) var headers: [HTTPHeader] = []
    
    init(headers: [HTTPHeader]) {
        self.headers = headers
    }
}

extension HTTPHeaders {
    var fields: [String: String] {
        .init(uniqueKeysWithValues: headers.map { ($0.key, $0.value) })
    }
}

public struct HTTPHeader {
    let key: String
    let value: String
}

public extension HTTPHeader {
    static func contentType(value: String) -> HTTPHeader {
        .init(key: "Content-Type", value: value)
    }
    
    static func accessToken(value: String) -> HTTPHeader {
        .init(key: "Authorization", value: "Bearer \(value)")
    }
    
    static func refreshToken(value: String) -> HTTPHeader {
        .init(key: "Authorization-refresh", value: "Bearer \(value)")
    }
    
    static func appleRefreshToken(value: String) -> HTTPHeader {
        .init(key: "Apple-refresh", value: value)
    }
    
    static func platformToken(value: String) -> HTTPHeader {
        .init(key: "Platform-Token", value: value)
    }
}
