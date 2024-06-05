//
//  KeychainKey.swift
//  APIClientSample
//
//  Created by 이성민 on 6/4/24.
//

import Foundation

public enum KeychainKey: String {
    case accessToken
    case refreshToken
    case appleRefreshToken
    case socialAuthCode
    case userRole
    case userEmail
    case socialType
}

extension KeychainKey {
    var createQuery: NSDictionary {
        [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: self.rawValue,
        ]
    }
}
