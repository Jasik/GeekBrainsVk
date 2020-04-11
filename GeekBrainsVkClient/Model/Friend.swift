//
//  Friend.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/29.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

struct FriendsResponse: Codable {
    let response: Friends
}

struct Friends: Codable {
    let count: Int
    let items: [Friend]
}

struct Friend: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let isClosed: Bool
    let canAccessClosed: Bool
    let nickname: String
    let photo100: String
}
