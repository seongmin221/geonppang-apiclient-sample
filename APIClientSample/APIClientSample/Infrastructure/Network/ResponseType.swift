//
//  ResponseType.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

public protocol ResponseType: Decodable {
    
    associatedtype DataType: Decodable
    
    var code: Int { get }
    var message: String? { get }
    var data: DataType { get }
}
