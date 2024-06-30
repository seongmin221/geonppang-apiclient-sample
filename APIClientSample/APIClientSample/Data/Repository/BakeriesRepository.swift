//
//  BakeriesRepository.swift
//  APIClientSample
//
//  Created by 이성민 on 6/22/24.
//

import Foundation

import GBNetwork

final class BakeriesRepositoryImpl: BakeriesRepository {
    
    typealias BakeryListResponse = Response<BakeryListDTO>
    
    private let apiClient: APIClient<BakeriesEndpoint> = .init()
    
    func getBakeryList(query: BakeryListQuery) async throws -> BakeryList {
        guard let response = try? await apiClient.send(.getBakeryList(query: query.toDictionary())) else {
            throw GBNetworkError.unknownFailure(description: "")
        }
        
        guard let dto = try? JSONDecoder().decode(BakeryListResponse.self, from: response.data) else {
            throw GBNetworkError.decodingFailure(.dtoDecodingError)
        }
        
        return dto.data.toDomain()
    }
}
