//
//  BestEndpoint.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

import GBNetwork

enum BestEndpoint {
    case getBestBakeries
    case getBestReviews
}

extension BestEndpoint: RequestType {
    var baseURL: String {
        return BundleAccess.baseURL
    }
    
    var path: String {
        switch self {
        case .getBestBakeries: "/best/bakeries"
        case .getBestReviews: "/best/reviews"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getBestBakeries: .GET
        case .getBestReviews: .GET
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getBestBakeries: .requestPlain
        case .getBestReviews: .requestPlain
        }
    }
    
    var headers: HTTPHeader {
        switch self {
        case .getBestBakeries:
            return .init(headers: [])
        case .getBestReviews:
            return .init(headers: [])
        }
    }
}
