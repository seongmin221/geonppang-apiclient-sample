//
//  BestBakery.swift
//  APIClientSample
//
//  Created by 이성민 on 6/4/24.
//

import Foundation

struct BestBakery: Codable {
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
