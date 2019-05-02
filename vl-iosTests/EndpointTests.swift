//
//  EndpointTests.swift
//  vl-iosTests
//
//  Created by Abdullah Selek on 02/05/2019.
//  Copyright © 2019 VerifID. All rights reserved.
//

import XCTest

@testable import vl_ios;

class EndpointTests: XCTestCase {

    func testCreateURL() {
        let url = Endpoint(path: "/user/sendData", queryItems: nil).url
        guard url != nil else {
            XCTFail("URL can't generated!")
            return
        }
        XCTAssertEqual(url?.absoluteString, "https://api.verifid.app/v1/user/sendData")
    }

}
