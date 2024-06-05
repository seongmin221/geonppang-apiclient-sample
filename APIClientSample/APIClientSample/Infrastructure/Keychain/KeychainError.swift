//
//  GBKeychainError.swift
//  APIClientSample
//
//  Created by 이성민 on 6/5/24.
//

import Foundation

enum GBKeychainError: Error {
    case duplicateItem
    case invalidID
    case decodingFailure
    case unknown
}
