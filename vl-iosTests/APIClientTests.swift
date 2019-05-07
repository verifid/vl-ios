//
//  APIClientTests.swift
//  vl-iosTests
//
//  Created by Abdullah Selek on 05/05/2019.
//  Copyright © 2019 VerifID. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import vl_ios;

class APIClientTests: XCTestCase {

    var apiClient: APIClient!
    var user: User!

    override func setUp() {
        apiClient = APIClient()
        user = User(country: "country",
                    dateOfBirth: "10.04.1980",
                    gender: "male",
                    name: "name",
                    placeOfBirth: "city",
                    surname: "surname")
    }

    override func tearDown() {
        apiClient = nil
        user = nil
    }

    func testSendUser() {
        stub(condition: isMethodPOST()) { _ in
            let stubPath = OHPathForFile("userResponse.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        let expectation = self.expectation(description: "Send user API call")
        apiClient.sendUser(user) { userResponse, error in
            XCTAssertNil(error)
            XCTAssertNotNil(userResponse)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testSendUser_withNetworkError() {
        stub(condition: isMethodPOST()) { _ in
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo: nil)
            return OHHTTPStubsResponse(error: notConnectedError)
        }
        let expectation = self.expectation(description: "Send user API call")
        apiClient.sendUser(user) { userResponse, error in
            XCTAssertNotNil(error)
            XCTAssertNil(userResponse)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }

}
