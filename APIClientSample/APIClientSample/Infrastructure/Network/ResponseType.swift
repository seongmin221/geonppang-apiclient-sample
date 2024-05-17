//
//  ResponseType.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

public struct ResponseType<Response: Decodable>: Decodable {
    let status: String?
    let message: String?
    let data: Response?
}
