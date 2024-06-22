//
//  BakeriesEndpoint.swift
//  APIClientSample
//
//  Created by 이성민 on 6/22/24.
//

import Foundation

import GBNetwork

enum BakeriesEndpoint {
    case getBakeryList(query: [String: String])
}

extension BakeriesEndpoint: RequestType {
    var baseURL: String {
        return BundleAccess.baseURL
    }
    
    var path: String {
        switch self {
        case .getBakeryList: "/bakeries"
        }
    }
    
    var method: GBNetwork.HTTPMethod {
        switch self {
        case .getBakeryList: .GET
        }
    }
    
    var task: GBNetwork.HTTPTask {
        switch self {
        case let .getBakeryList(query): .requestQuery(query)
        }
    }
    
    var headers: GBNetwork.HTTPHeader {
        switch self {
        case .getBakeryList: .init(headers: [])
        }
    }
}
