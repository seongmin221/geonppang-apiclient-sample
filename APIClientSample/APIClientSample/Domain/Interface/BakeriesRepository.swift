//
//  BakeriesRepository.swift
//  APIClientSample
//
//  Created by 이성민 on 6/30/24.
//

import Foundation

protocol BakeriesRepository {
    func getBakeryList(query: BakeryListQuery) async throws -> BakeryList
}
