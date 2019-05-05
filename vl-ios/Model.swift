//
//  Model.swift
//  vl-ios
//
//  Created by Abdullah Selek on 26.04.19.
//  Copyright © 2019 VerifID. All rights reserved.
//

import Foundation

public struct User: Encodable {
    let country: String
    let dateOfBirth: String
    let gender: String
    let name: String
    let placeOfBirth: String
    let surname: String

    public init(country: String,
                dateOfBirth: String,
                gender: String,
                name: String,
                placeOfBirth: String,
                surname: String) {
        self.country = country
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.name = name
        self.placeOfBirth = placeOfBirth
        self.surname = surname
    }

    enum CodingKeys: String, CodingKey {
        case country, dateOfBirth, gender, name, placeOfBirth, surname
    }
}

public struct UserResponse: Decodable {
    let code: Int
    let message: String
    let type: String
    let userId: String?

    enum CodingKeys: String, CodingKey {
        case code, message, type, userId
    }
}

public struct ImageUploadResponse: Decodable {
    let code: Int
    let message: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case code, message, type
    }
}
