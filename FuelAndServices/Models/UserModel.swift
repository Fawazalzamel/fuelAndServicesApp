//
//  UserModel.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 12/03/2024.
//

import Foundation
struct UserModel: Codable {
    let user_Id: Int
    let username: String
    let email: String
    let password: String
    let phoneNumber: Int
    let token: TokenResponse
}
