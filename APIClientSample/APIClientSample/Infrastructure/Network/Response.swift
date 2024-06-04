//
//  Response.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

public struct Response<DTO: Decodable>: Decodable {
    let code: Int?
    let message: String?
    let data: DTO?
}

//public extension Response {
//    func decode() throws -> DTO {
//        
//    }
//}
