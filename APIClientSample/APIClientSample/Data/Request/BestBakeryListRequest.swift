//
//  BestBakeryListRequest.swift
//  APIClientSample
//
//  Created by 이성민 on 5/31/24.
//

import Foundation

struct EmptyBody: Encodable {}

class BestBakeryListRequest: RequestType {
    typealias ReqDTO = EmptyBody
    typealias ResDTO = BestBakeryListResDTO
    
    var method: HTTPMethod { .get }
    var path: String? = "/best/bakeries"
    var queries: [String : String]? = nil
    var headers: [String : String]? = nil
    var body: EmptyBody? = nil
}
