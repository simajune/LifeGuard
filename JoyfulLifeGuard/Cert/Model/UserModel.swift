//
//  UserModel.swift
//  JoyfulLifeGuard
//
//  Created by 정태준 on 2021/10/19.
//

import UIKit

struct UserModel: Codable {
    let profile: Data
    let name: String
    let birthDay: String
    let regiserDay: String
}
