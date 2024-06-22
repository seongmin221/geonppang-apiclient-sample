//
//  BakeriesRepository.swift
//  APIClientSample
//
//  Created by 이성민 on 6/22/24.
//

import Foundation

import GBNetwork

protocol BakeriesRepository {
    func getBakeryList(query: BakeryListRequestDTO) async throws -> Response<BakeryListDTO>
}

final class BakeriesRepositoryImpl: BakeriesRepository {
    
    private let apiClient: APIClient<BakeriesEndpoint> = .init()
    
    func getBakeryList(query: BakeryListRequestDTO) async throws -> Response<BakeryListDTO> {
        let query = query.toDictionary()
        let response = try await apiClient.send(.getBakeryList(query: query))
        return try response.decode()
    }
}
