//
//  BestBakery.swift
//  APIClientSample
//
//  Created by 이성민 on 6/4/24.
//

import Foundation
import GBNetwork

struct BestBakeryDTO: ResponseType {
    
    var code: Int
    var message: String?
    var data: Datum
    
    struct Datum: Decodable {
        let bakeryID: Int
        let bakeryName: String
        let bakeryPicture: String
        let isHACCP, isVegan, isNonGMO: Bool
        let firstNearStation: String
        let secondNearStation: String
        let reviewCount, bookMarkCount: Int

        enum CodingKeys: String, CodingKey {
            case bakeryID = "bakeryId"
            case bakeryName
            case bakeryPicture
            case isHACCP, isVegan, isNonGMO
            case firstNearStation, secondNearStation
            case reviewCount
            case bookMarkCount
        }
    }
}

extension BestBakeryDTO.Datum {
    
    func toDomain() -> BestBakery {
        let overview: BakeryOverview = .init(
            id: bakeryID,
            name: bakeryName,
            image: bakeryPicture
        )
        let certifications: Certifications = .init(
            isHaccp: isHACCP, 
            isVegan: isVegan,
            isNonGMO: isNonGMO
        )
        let regions: Regions = .init(
            firstRegion: firstNearStation,
            secondRegion: secondNearStation
        )
        
        return BestBakery(
            overview: overview,
            certifications: certifications,
            bookmarkCount: bookMarkCount,
            reviewCount: reviewCount,
            regions: regions
        )
    }
}
