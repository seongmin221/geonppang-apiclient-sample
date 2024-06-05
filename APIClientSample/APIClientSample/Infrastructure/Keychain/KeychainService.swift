//
//  KeychainService.swift
//  APIClientSample
//
//  Created by 이성민 on 6/4/24.
//

import Foundation

public final class KeychainService {
    
    private static let serviceName = "GEON-PPANG"
    
    /// `KeychainKey` 중 하나를 `key`로 하고 값은 `value`인 키체인 생성
    public static func create(key: KeychainKey, to value: String) throws {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrAccount: key.rawValue,
            kSecValueData: value.data(using: .utf8)!
        ]
        
        /// 중복된 값이 있으면 안되므로 미리 삭제 처리
        SecItemDelete(query)
        
        /// 만든 query로 아이템 추가
        let status: OSStatus = SecItemAdd(query, nil)
        switch status {
        case errSecSuccess:
            #if DEBUG
            print("🔒 Create: \(key.rawValue) keychain created successfully 🔒")
            #endif
            
        case errSecDuplicateItem:
            #if DEBUG
            print("❌ Create: \(key.rawValue) keychain already exists ❌")
            #endif
            throw KeychainError.duplicateItem
            
        case errSecInvalidID:
            #if DEBUG
            print("❌ Create: Invalid \(key.rawValue) key ❌")
            #endif
            throw KeychainError.invalidID
            
        default:
            #if DEBUG
            print("❌ Create: Unknown error with \(key.rawValue) ❌")
            #endif
            throw KeychainError.unknown
        }
    }
    
    /// `KeychainKey`를 키로 하는 키체인 값 읽기
    public static func read(key: KeychainKey) throws -> String {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrAccount: key.rawValue,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        switch status {
        case errSecSuccess:
            #if DEBUG
            print("🔒 Read: \(key.rawValue) keychain read successfully 🔒")
            #endif
            guard let retrivedData = dataTypeRef as? Data,
                  let value = String(data: retrivedData, encoding: .utf8)
            else {
                throw KeychainError.decodingFailure
            }
            return value
            
        case errSecInvalidID:
            #if DEBUG
            print("❌ Read: Invalid \(key.rawValue) key ❌")
            #endif
            throw KeychainError.invalidID
            
        default:
            #if DEBUG
            print("❌ Read: Unknown error with \(key.rawValue) ❌")
            #endif
            throw KeychainError.unknown
        }
    }
    
    /// `KeychainKey` 중 하나를 키로 하는 키체인 값을 `value`로 업데이트
    public static func update(key: KeychainKey, to value: String) throws {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrAccount: key.rawValue
        ]
        
        let updatedAttributes: NSDictionary = [
            kSecValueData: value.data(using: .utf8)!
        ]
        
        let status = SecItemUpdate(query, updatedAttributes)
        switch status {
        case errSecSuccess:
            #if DEBUG
            print("🔒 Update: \(key.rawValue) keychain updated successfully 🔒")
            #endif
            
        case errSecInvalidID:
            #if DEBUG
            print("❌ Update: Invalid \(key.rawValue) key ❌")
            #endif
            throw KeychainError.invalidID
            
        default:
            #if DEBUG
            print("❌ Update: Unknown error with \(key.rawValue) ❌")
            #endif
            throw KeychainError.unknown
        }
    }
    
    public static func delete(key: KeychainKey) throws {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrAccount: key.rawValue
        ]
        
        let status = SecItemDelete(query)
        switch status {
        case errSecSuccess:
            #if DEBUG
            print("🔒 Delete: \(key.rawValue) keychain deleted successfully 🔒")
            #endif
            
        case errSecInvalidID:
            #if DEBUG
            print("❌ Delete: Invalid \(key.rawValue) key ❌")
            #endif
            throw KeychainError.invalidID
            
        default:
            #if DEBUG
            print("❌ Delete: Unknown error with \(key.rawValue) ❌")
            #endif
            throw KeychainError.unknown
        }
    }
    
}
