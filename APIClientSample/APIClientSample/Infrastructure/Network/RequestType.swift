//
//  RequestType.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

public protocol RequestType: Encodable {
    
    associatedtype ReqDTO: Encodable
    associatedtype ResDTO: Decodable
    
    /// 실제로 사용하는 HTTP Method만 정의 - Get, Post, Delete
    var method: HTTPMethod { get }
    /// Base URL 뒤에 붙는 URL Path
    var path: String? { get set }
    /// 추가적인 query가 필요할 때 사용
    var queries: [String: String]? { get set }
    /// Request 마다 필요한 Header Fields
    var headers: [String: String]? { get set }
    /// 추가적인 Body가 필요할 때 사용
    var body: ReqDTO? { get set }
}

