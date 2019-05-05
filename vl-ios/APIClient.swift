//
//  VLClient.swift
//  vl-ios
//
//  Created by Abdullah Selek on 25.04.19.
//  Copyright © 2019 VerifID. All rights reserved.
//

import Foundation

public protocol APIClientProtocol: Any {
    func sendUser(_ user: User, completionBlock: @escaping (_ userResponse: UserResponse?, _ error: APIClient.Error?) -> Void)
}

open class APIClient: APIClientProtocol {

    fileprivate let defaultSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Timeout.IntervalForRequest
        configuration.timeoutIntervalForResource = Timeout.IntervalForResource
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }()

    public init() { }

    public func sendUser(_ user: User, completionBlock: @escaping (UserResponse?, APIClient.Error?) -> Void) {
        guard let url = Endpoint(path: "/user/sendData", queryItems: nil).url else {
            completionBlock(nil, .brokenURL)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
            let jsonData = try JSONEncoder().encode(user)
            urlRequest.httpBody = jsonData
        } catch {
            completionBlock(nil, .serialization(error.localizedDescription))
            return
        }
        let task = defaultSession.dataTask(with: urlRequest) { data, urlResponse, error in
            if let error = error {
                completionBlock(nil, .http(error.localizedDescription))
                return
            }
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                return
            }
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    return
                }
                do {
                    let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                    completionBlock(userResponse, nil)
                } catch let error {
                    completionBlock(nil, .serialization(error.localizedDescription))
                }
            } else {
                completionBlock(nil, .http("Status failed!"))
            }
        }
        task.resume()
    }

}

public extension APIClient {

    enum Error: Swift.Error, Equatable {
        case brokenURL
        case serialization(String)
        case http(String)
    }

}
