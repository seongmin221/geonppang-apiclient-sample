//
//  BestRepository.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

protocol BestRepository {
    func getBestBakeries() async throws -> Response<BestBakeryDTO>
    func getBestReviews() async throws -> Response<BestReviewDTO>
}

final class BestRepositoryImpl: BestRepository {
    private let apiClient: APIClient<BestEndpoint> = .init()
    
    func getBestBakeries() async throws -> Response<BestBakeryDTO> {
        let response = try await apiClient.send(.getBestBakeries)
        return try response.decode()
    }
    
    func getBestReviews() async throws -> Response<BestReviewDTO> {
        let response = try await apiClient.send(.getBestReviews)
        return try response.decode()
    }
    
    
}
