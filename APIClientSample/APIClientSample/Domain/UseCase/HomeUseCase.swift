//
//  HomeUseCase.swift
//  APIClientSample
//
//  Created by 이성민 on 6/7/24.
//

import Foundation

protocol HomeUseCase {
    func fetchBestBakeries() async throws -> [BestBakery]
    func fetchBestReviews()
}

final class HomeUseCaseImpl: HomeUseCase {
    let repository: BestRepository
    
    init(repository: BestRepository) {
        self.repository = repository
    }
    
    func fetchBestBakeries() async throws -> [BestBakery] {
        return []
//        let entity = try await repository.getBestBakeries()
//        return entity
//        Task {
//            do {
//                let dto = try await repository.getBestBakeries()
//                return dto.
//            } catch GBNetworkError
//        }
    }
    
    func fetchBestReviews() {
        
    }
}
