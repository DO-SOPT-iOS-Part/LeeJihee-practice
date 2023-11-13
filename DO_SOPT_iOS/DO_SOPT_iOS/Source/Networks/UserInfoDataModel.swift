//
//  UserInfoDataModel.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/11/11.
//
import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}
