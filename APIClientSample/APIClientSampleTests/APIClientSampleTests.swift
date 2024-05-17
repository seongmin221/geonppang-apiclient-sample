//
//  APIClientSampleTests.swift
//  APIClientSampleTests
//
//  Created by 이성민 on 5/15/24.
//

import XCTest
@testable import APIClientSample

import Combine

final class APIClientSampleTests: XCTestCase {

    var apiClient: APIClient?
    var request: SignInRequest?
    var cancelBag: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        
        apiClient = APIClient()
        request = SignInRequest()
    }

    override func tearDown() {
        super.tearDown()
        
        apiClient = nil
        request = nil
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    /// 디바이스 기반 조회
    func test_fetch_profile_from_device_id() {
        let expectation = XCTestExpectation()
        expectation.expectedFulfillmentCount = 1
        
        apiClient?.send(request!)
            .sink(receiveCompletion: { completion in
                print("Completion received: \(completion)")
                XCTFail()
            }, receiveValue: { response in
                dump(response)
                XCTAssertTrue(true, "일단 api 성공하는지만 체크")
            })
            .store(in: &cancelBag)
            
        
        wait(for: [expectation], timeout: 5)
    }

}
