//
//  SampleRequest.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

struct SampleRequest: RequestType {
    typealias Response = <#type#>
    
    var path: String
    var method: HTTPMethod
    var task: HTTPTask
    var header: HTTPHeaders
}
