//
//  Friend.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/29.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation
import RealmSwift

class FriendsResponse: Codable {
    let response: Friends
}

class Friends: Codable {
    let count: Int
    let items: [Friend]
}

@objcMembers class Friend: Object, Codable {
    dynamic let id: Int
    dynamic let firstName: String
    dynamic let lastName: String
    dynamic let isClosed: Bool
    dynamic let canAccessClosed: Bool
    dynamic let nickname: String
    dynamic let photo100: String
}

/// TODO: delete
//struct FriendsResponse: Codable {
//    let response: Friends
//}
//
//struct Friends: Codable {
//    let count: Int
//    let items: [Friend]
//}
//
//struct Friend: Codable {
//    let id: Int
//    let firstName: String
//    let lastName: String
//    let isClosed: Bool
//    let canAccessClosed: Bool
//    let nickname: String
//    let photo100: String
//}
