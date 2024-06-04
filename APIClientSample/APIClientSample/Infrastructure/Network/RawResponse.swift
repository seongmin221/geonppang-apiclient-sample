//
//  RawResponse.swift
//  APIClientSample
//
//  Created by 이성민 on 6/4/24.
//

import Foundation

public struct RawResponse {
    let data: Data
    let httpURLResponse: HTTPURLResponse
}

public extension RawResponse {
    func decode<DTO: Decodable>() throws -> Response<DTO> {
        do {
            return try JSONDecoder().decode(Response<DTO>.self, from: data)
        } catch {
            throw GBNetworkError.decodingFailure(.dtoDecodingError)
        }
    }
}
