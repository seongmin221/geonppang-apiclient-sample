//
//  APIClient.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation
import Combine

//public protocol APIClient {
//    func send<Req: RequestType>(
//        _ request: Req
//    ) -> AnyPublisher<Req.ResDTO, Error>
//}

public class APIClient {
    func send<Req: RequestType>(
        _ request: Req
    ) -> AnyPublisher<Req.ResDTO, Error> {
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession.init(configuration: configuration)
        
        let request = createRequest(with: request)
        
        return urlSession.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                switch httpResponse.statusCode {
                case 200..<300: return data
                default: throw URLError(.badURL)
                }
            }
            .decode(type: Req.ResDTO.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


extension APIClient {
    func createRequest(with requestType: any RequestType) -> URLRequest {
        
        guard var requestURL: URL = .init(string: BundleAccess.baseURL) else {
            fatalError("url creation failure")
        }
        
        if let path = requestType.path {
            requestURL.append(path: path)
        }
        
        if let queries = requestType.queries {
            requestURL.append(queryItems: queries
                .map { key, value in .init(name: key, value: value) })
        }
        
        var request: URLRequest = .init(url: requestURL)
        request.httpMethod = requestType.method.rawValue
        
        if let headers = requestType.headers {
            headers.forEach { key, value in
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
        
        
//        let requestURL = createURL(with: requestType)
//        
//        var request = URLRequest(url: requestURL)
//        request.httpMethod = requestType.method.rawValue
//        
//        if let body = requestType.body?.encode(to: ) {
//            request.httpBody = body
//        }
//        
//        if let header = requestType.headers {
//            request.allHTTPHeaderFields = header
//        }
//        
//        return request
    }
    
//    private func createURL(with requestType: any RequestType) -> URL {
//        var requestURLString = BundleAccess.baseURL
//        
//        if let path = requestType.path {
//            requestURLString += path
//        }
//        
//        guard var urlComponents: URLComponents = .init(string: requestURLString) else {
//            fatalError()
//        }
//        
//        if let queries = requestType.queries {
//            urlComponents.queryItems = queries
//                .map { .init(name: $0.key, value: $0.value) }
//        }
//        
//        return urlComponents.url!
//    }
}
