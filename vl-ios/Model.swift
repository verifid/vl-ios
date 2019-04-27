//
//  Model.swift
//  vl-ios
//
//  Created by Abdullah Selek on 26.04.19.
//  Copyright © 2019 VerifID. All rights reserved.
//

import Foundation

public struct User: Codable {
    let country: String
    let dateOfBirth: String
    let gender: String
    let name: String
    let placeOfBirth: String
    let surname: String
}

public struct UserResponse: Decodable {
    let code: Int
    let message: String
    let type: String
    let userId: String?

    enum CodingKeys: String, CodingKey {
        case code, message, type, userId = "user_id"
    }
}
