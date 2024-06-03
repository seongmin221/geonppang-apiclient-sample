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
    ///
    /// - Request의 HTTP Method:
    /// 현재는 GET, POST, DELETE만 사용하기 때문에 세 가지만 설정
    ///
    /// - computed property로 한 이유는 encodable에 걸리지 않기 때문
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

private extension RequestType {
    // FIXME: need to find different way to access bundle
    var baseURLString: String { BundleAccess.baseURL }
    
    func toQueryItem(_ query: (key: String, value: String)) -> URLQueryItem {
        return .init(name: query.key, value: query.value)
    }
}

extension RequestType {
    /// converting `RequestType` to `URLRequest`
    func toURLRequest() -> URLRequest {
        
        // Creating URL
        guard var requestURL: URL = .init(string: baseURLString) else {
            fatalError("base url access failed")
        }
        
        if let path {
            requestURL.append(path: path)
        }
        
        if let queries {
            requestURL.append(queryItems: queries.map(toQueryItem))
        }
        
        // Creating Request
        var request: URLRequest = .init(url: requestURL)
        request.httpMethod = self.method.rawValue
        
        if let headers {
            headers.forEach { key, value in request.addValue(value, forHTTPHeaderField: key) }
        }
        
        if let body {
            request.httpBody = try? JSONEncoder().encode(body)
            // TODO: NetworkError.encodingFailed 처리
        }
        
        return request
    }
}
