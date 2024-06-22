//
//  HomeUseCase.swift
//  APIClientSample
//
//  Created by 이성민 on 6/7/24.
//

import Foundation

protocol HomeUseCase {
    func fetchBestBakeries()
    func fetchBestReviews()
}

final class HomeUseCaseImpl: HomeUseCase {
    let repository: BestRepository
    
    init(repository: BestRepository) {
        self.repository = repository
    }
    
    func fetchBestBakeries() -> Void {
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
