//
//  SampleRepository.swift
//  APIClientSample
//
//  Created by 이성민 on 6/2/24.
//

import Foundation

protocol BakeryListRepository {
    func getBestBakeryList() async throws -> BestBakeryListResDTO
    func getBestReviewList()
}

final class BakeryListRepositoryImpl: BakeryListRepository {
    
    private let apiClient: APIClient
    private let decoder: JSONDecoder?
    
    init(apiClient: APIClient, decoder: JSONDecoder) {
        self.apiClient = apiClient
        self.decoder = decoder
    }
    
    func getBestBakeryList() async throws -> BestBakeryListResDTO {
        let request = BestBakeryListRequest()
        do {
            let data = try await apiClient.send(request)
            return try JSONDecoder().decode(BestBakeryListResDTO.Type, from: data)
        } catch {
            
        }
    }
    
    func getBestReviewList() {
        
    }
}
