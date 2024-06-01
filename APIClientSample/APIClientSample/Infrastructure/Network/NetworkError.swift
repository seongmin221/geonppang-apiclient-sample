//
//  NetworkError.swift
//  APIClientSample
//
//  Created by 이성민 on 5/29/24.
//

import Foundation

enum NetworkError: Error {
    case clientError
    case serverError
    case encodingFailed
}
