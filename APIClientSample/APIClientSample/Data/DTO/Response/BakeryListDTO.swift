//
//  BakeryListDTO.swift
//  APIClientSample
//
//  Created by 이성민 on 6/22/24.
//

import Foundation

struct BakeryListDTO: Decodable {
    let content: [Content]
    let pageable: Pageable
    let totalPages, totalElements: Int
    let last: Bool
    let number: Int
    let sort: Sort
    let size, numberOfElements: Int
    let first, empty: Bool
}

// MARK: - Content
struct Content: Decodable {
    let bakeryID: Int
    let bakeryName: String
    let bakeryPicture: String
    let isHACCP, isVegan, isNonGMO: Bool
    let firstNearStation, secondNearStation: String
    let reviewCount: Int
    let breadTypeList: [BreadTypeList]
    let bookMarkCount: Int

    enum CodingKeys: String, CodingKey {
        case bakeryID = "bakeryId"
        case bakeryName, bakeryPicture, isHACCP, isVegan, isNonGMO, firstNearStation, secondNearStation, reviewCount, breadTypeList, bookMarkCount
    }
}

// MARK: - BreadTypeList
struct BreadTypeList: Decodable {
    let breadTypeID: Int

    enum CodingKeys: String, CodingKey {
        case breadTypeID = "breadTypeId"
    }
}

// MARK: - Pageable
struct Pageable: Decodable {
    let sort: Sort
    let offset, pageNumber, pageSize: Int
    let paged, unpaged: Bool
}

// MARK: - Sort
struct Sort: Decodable {
    let empty, sorted, unsorted: Bool
}

extension BakeryListDTO {
    func toDomain() -> BakeryList {
        return .init()
    }
}
