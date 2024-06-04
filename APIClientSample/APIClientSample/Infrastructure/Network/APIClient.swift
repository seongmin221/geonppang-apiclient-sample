//
//  APIClient.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

public protocol APIClientType {
    associatedtype Request: RequestType
    
    func send(
        _ request: Request
    ) async throws -> RawResponse
}

final class APIClient<Request: RequestType>: APIClientType {
    
    func send(
        _ request: Request
    ) async throws -> RawResponse {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let (data, urlResponse) = try await session.data(for: request.toURLRequest())
        
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw GBNetworkError.decodingFailure(.httpDecodingError)
        }
        
        let rawResponse: RawResponse = .init(data: data, httpURLResponse: httpResponse)
        
        switch httpResponse.statusCode {
        case 200..<300:
            return rawResponse
        case 400..<500:
            throw GBNetworkError.responseFailure(.clientError(httpResponse))
        case 500..<600:
            throw GBNetworkError.responseFailure(.serverError(httpResponse))
        default:
            throw GBNetworkError.responseFailure(.invalidError(httpResponse))
        }
    }
}
