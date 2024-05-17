//
//  SignInReqDTO.swift
//  APIClientSample
//
//  Created by 이성민 on 5/15/24.
//

import Foundation

struct SignInReqDTO: Encodable {
    let email: String
    let password: String
}
