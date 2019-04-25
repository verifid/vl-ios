//
//  VLClient.swift
//  vl-ios
//
//  Created by Abdullah Selek on 25.04.19.
//  Copyright © 2019 VerifID. All rights reserved.
//

import Foundation

open class VLClient {

    fileprivate let jsonSerialization = JSONSerialization()
    fileprivate let defaultSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Timeout.IntervalForRequest
        configuration.timeoutIntervalForResource = Timeout.IntervalForResource
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }()

    public init() { }

}
