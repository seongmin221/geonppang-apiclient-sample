//
//  APIClient.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

public protocol APIClient {
//    associatedtype Request: RequestType
    
    func send<Request: RequestType>(
        _ request: Request
    ) async throws -> Data
}

public extension APIClient {
    func send<Request: RequestType>(
        _ request: Request
    ) async throws -> Data {
        /// URLSession Configuration
        let configuration = URLSessionConfiguration.default
        let urlSession = URLSession.init(configuration: configuration)
        
        /// Converting `request` to `URLRequest`
        let urlRequest = request.toURLRequest()
        
        /// Asynchronously requesting data
        let (data, urlResponse) = try await urlSession.data(for: urlRequest)
        
        /// Returns data if possible or throws specified error
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw GBNetworkError.unknownFailure(description: "failed to convert urlResponse to httpResponse")
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return data
        case 400..<500:
            throw GBNetworkError.responseFailure(.clientError(httpResponse))
        case 500..<600:
            throw GBNetworkError.responseFailure(.serverError(httpResponse))
        default:
            throw GBNetworkError.responseFailure(.invalidError(httpResponse))
        }
    }
}











//public protocol APIClient {
//    func send<Req: RequestType>(
//        _ request: Req
//    ) -> AnyPublisher<Req.ResDTO, Error>
//}
//
//extension APIClient {
//    func send<Req: RequestType>(
//        _ request: Req
//    ) -> AnyPublisher<Req.ResDTO, Error> {
//        let configuration = URLSessionConfiguration.default
//        let urlSession = URLSession.init(configuration: configuration)
//
//        let request = createRequest(with: request)
//
//        return urlSession.dataTaskPublisher(for: request)
//            .tryMap { (data, response) -> Data in
//                guard let httpResponse = response as? HTTPURLResponse else {
//                    throw URLError(.badServerResponse)
//                }
//
//                switch httpResponse.statusCode {
//                case 200..<300: return data
//                default: throw URLError(.badURL)
//                }
//            }
//            .decode(type: Req.ResDTO.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//    }
//}
//
//
//extension APIClient {
//    func createRequest(with requestType: any RequestType) -> URLRequest {
//
//        guard var requestURL: URL = .init(string: BundleAccess.baseURL) else {
//            fatalError("url creation failure")
//        }
//
//        if let path = requestType.path {
//            requestURL.append(path: path)
//        }
//
//        if let queries = requestType.queries {
//            requestURL.append(queryItems: queries
//                .map { key, value in .init(name: key, value: value) })
//        }
//
//        var request: URLRequest = .init(url: requestURL)
//        request.httpMethod = requestType.method.rawValue
//
//        if let headers = requestType.headers {
//            headers.forEach { key, value in
//                request.addValue(value, forHTTPHeaderField: key)
//            }
//        }
//
//        if let body = requestType.body {
//            JSONEncoder()
//        }
//
//        return request
//
//
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
//    }
//
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
//}
