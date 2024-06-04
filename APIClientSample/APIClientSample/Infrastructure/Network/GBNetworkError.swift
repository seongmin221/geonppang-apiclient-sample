//
//  GBNetworkError.swift
//  APIClientSample
//
//  Created by 이성민 on 6/3/24.
//

import Foundation

public enum GBNetworkError: Error {
    /// Creating `URL` from `String` failure
    case urlCreationFailure(urlString: String)
    
    /// Encoding  to `URLRequest` failure
    case requestEncodingFailure(EncodingFailureReason)
    
    /// Failure received from response
    case responseFailure(ResponseFailureReason)
    
    /// Decoding `Data` to response type failure
    case decodingFailure(DecodingFailureReason)
    
    /// Failure other than the failures above
    ///
    /// - Unexpected failures such as `urlResponse`
    /// to `HTTPURLResponse` converting failure
    /// will be described by this failure
    case unknownFailure(description: String)
}


public extension GBNetworkError {
    
    enum EncodingFailureReason {
        case pathError(String)
        case jsonError(String)
    }
    
    /// detailed reason why `.responseFailure` occurred
    enum ResponseFailureReason {
        case clientError(URLResponse)
        case serverError(URLResponse)
        case invalidError(URLResponse)
    }
    
    enum DecodingFailureReason {
        case httpDecodingError
        case dtoDecodingError
    }
}
