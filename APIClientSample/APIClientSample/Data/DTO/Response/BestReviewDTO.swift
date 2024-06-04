//
//  BestReviewDTO.swift
//  APIClientSample
//
//  Created by 이성민 on 6/4/24.
//

import Foundation

// MARK: - Datum
struct BestReviewDTO: Decodable {
    let bakeryID: Int
    let bakeryName: String
    let bakeryPicture: String
    let isHACCP, isVegan, isNonGMO: Bool
    let firstNearStation, secondNearStation: String
    let reviewCount: Int
    let reviewText: String
    let firstMaxRecommendKeyword: String
    let secondMaxRecommendKeyword: String
    let bookMarkCount: Int

    enum CodingKeys: String, CodingKey {
        case bakeryID = "bakeryId"
        case bakeryName, bakeryPicture, isHACCP, isVegan, isNonGMO, firstNearStation, secondNearStation, reviewCount, reviewText, firstMaxRecommendKeyword, secondMaxRecommendKeyword, bookMarkCount
    }
}
