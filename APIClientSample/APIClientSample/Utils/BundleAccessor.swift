//
//  BundleAccessor.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

final class BundleAccess {
    static let baseURL = accessBundle(withKey: "BaseURL")
    
    private static func accessBundle(withKey key: String) -> String {
        Bundle.main.object(forInfoDictionaryKey: key) as! String
    }
}
