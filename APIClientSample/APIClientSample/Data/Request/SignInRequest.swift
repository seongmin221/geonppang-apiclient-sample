//
//  SignInRequest.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

struct SignInRequest: RequestType {
    
    typealias ReqDTO = SignInReqDTO
    typealias ResDTO = SignInResDTO
    
    var method: HTTPMethod { .post }
    var path: String? = "/login"
    var queries: [String : String]? = nil
    var headers: [String : String]? = nil
    var body: SignInReqDTO? = .init(email: "test", password: "test")
}
