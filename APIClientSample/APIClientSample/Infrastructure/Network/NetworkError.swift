//
//  NetworkError.swift
//  APIClientSample
//
//  Created by 이성민 on 5/29/24.
//

import Foundation

public enum GBNetworkError: Error {
    
    /// Creating `URL` from `String` failure
    case urlCreationFailure(urlString: String)
    
    /// Encoding body to `json` failure
    case bodyEncodingFailure
    
    /// Failure received from response
    case responseFailure(ResponseFailureReason)
    
    /// Decoding `Data` to response type failure
    case dataDecodingFailure(data: Data)
    
    /// Failure other than the failures above
    ///
    /// - Unexpected failures such as `urlResponse`
    /// to `HTTPURLResponse` converting failure
    /// will be described by this failure
    case unknownFailure(description: String)
}

public extension GBNetworkError {
    
    /// detailed reason why `.responseFailure` occurred
    enum ResponseFailureReason {
        case clientError(URLResponse)
        case serverError(URLResponse)
        case invalidError(URLResponse)
    }
}
