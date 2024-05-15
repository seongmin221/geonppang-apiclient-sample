//
//  BundleAccessor.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

final class BundleAccess {
    static var APIKey: String { accessBundle(withKey: "GoogleAPIKey") }
    
    private static func accessBundle(withKey key: String) -> String {
        Bundle.main.object(forInfoDictionaryKey: key) as! String
    }
}
