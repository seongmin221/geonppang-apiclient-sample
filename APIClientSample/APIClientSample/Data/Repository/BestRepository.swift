//
//  SampleRepository.swift
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
    private let apiClient: APIClientType
    
    func getBestBakeries() async throws -> Response<BestBakeryDTO> {
        <#code#>
    }
    
    func getBestReviews() async throws -> Response<BestReviewDTO> {
        <#code#>
    }
    
    
}
