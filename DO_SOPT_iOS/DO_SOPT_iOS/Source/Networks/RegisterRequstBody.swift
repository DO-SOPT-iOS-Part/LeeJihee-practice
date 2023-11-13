//
//  RegisterRequstBody.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/11/11.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
