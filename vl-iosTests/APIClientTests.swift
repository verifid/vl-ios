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

    func testSendUser() {
        let user = User(country: "country",
                        dateOfBirth: "10.04.1980",
                        gender: "male",
                        name: "name",
                        placeOfBirth: "city",
                        surname: "surname")
        let apiClient = APIClient()
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

}
