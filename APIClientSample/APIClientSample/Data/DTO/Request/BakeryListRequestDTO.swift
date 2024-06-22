//
//  BakeryListRequestDTO.swift
//  APIClientSample
//
//  Created by 이성민 on 6/22/24.
//

import Foundation

struct BakeryListRequestDTO {
    let sortingOption: SortingOption
    let personalFilter: Bool
    let isHard: Bool
    let isDessert: Bool
    let isBrunch: Bool
    let pageNumber: Int
    
    init(
        sortingOption: SortingOption,
        personalFilter: Bool,
        isHard: Bool,
        isDessert: Bool,
        isBrunch: Bool,
        pageNumber: Int = 1
    ) {
        self.sortingOption = sortingOption
        self.personalFilter = personalFilter
        self.isHard = isHard
        self.isDessert = isDessert
        self.isBrunch = isBrunch
        self.pageNumber = pageNumber
    }
}

extension BakeryListRequestDTO {
    enum SortingOption: String {
        case `default`
        case review
    }
}

extension BakeryListRequestDTO {
    func toDictionary() -> [String: String] {
        [
            "sortingOption": sortingOption.rawValue,
            "personalFilter": personalFilter.description,
            "isHard": isHard.description,
            "isDessert": isDessert.description,
            "isBrunch": isBrunch.description,
            "pageNumber": pageNumber.description
        ]
    }
}

