//
//  URLRequest+Encoding.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

extension URLRequest {
    func encode(queries: [String: Any]) throws -> URLRequest {
        guard var url = self.url else {
            throw GBNetworkError.requestEncodingFailure(.pathError("missing url"))
        }
        url.append(queryItems: queries.map(toQueryItem))
        
        return .init(url: url)
    }
    
    func encode(body: Encodable) throws -> URLRequest {
        do {
            var request = self
            request.httpBody = try JSONEncoder().encode(body)
            return request
        } catch {
            throw GBNetworkError.requestEncodingFailure(.jsonError("incorrect body type"))
        }
    }
}

private extension URLRequest {
    func toQueryItem(_ query: (key: String, value: Any)) -> URLQueryItem {
        .init(name: query.key, value: query.value as? String)
    }
}
