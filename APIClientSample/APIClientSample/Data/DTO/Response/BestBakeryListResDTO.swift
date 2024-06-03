//
//  BestBakeryListResDTO.swift
//  APIClientSample
//
//  Created by 이성민 on 5/31/24.
//

import Foundation

struct BestBakeryListResDTO: Decodable {
    let code: Int
    let message: String
    let data: [BestBakery]
}

// MARK: - Datum
struct BestBakery: Decodable {
    let bakeryID: Int
    let bakeryName: String
    let bakeryPicture: String
    let isHACCP, isVegan, isNonGMO: Bool
    let firstNearStation: String
    let secondNearStation: String
    let reviewCount, bookMarkCount: Int

    enum CodingKeys: String, CodingKey {
        case bakeryID = "bakeryId"
        case bakeryName, bakeryPicture, isHACCP, isVegan, isNonGMO, firstNearStation, secondNearStation, reviewCount, bookMarkCount
    }
}
