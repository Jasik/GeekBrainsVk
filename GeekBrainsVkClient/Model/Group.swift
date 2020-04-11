//
//  Group.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/20.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

struct GroupResponse: Codable {
    let response: Groups
}

struct Groups: Codable {
    let count: Int
    let items: [Group]
}

struct Group: Codable {
    let id: Int
    let isAdmin: Int
    let isAdvertiser: Int
    let isClosed: Int
    let isMember: Int
    let name: String
    let photo100: String
    let photo200: String
    let photo50: String
    let screenName: String
    let type: String
}
