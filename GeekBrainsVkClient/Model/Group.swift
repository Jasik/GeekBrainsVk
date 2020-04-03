//
//  Group.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/20.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation
import RealmSwift

class GroupResponse: Codable {
    let response: Groups
}

class Groups: Codable {
    let count: Int
    let items: [Group]
}

@objcMembers class Group: Object, Codable {
    dynamic let id: Int
    dynamic let isAdmin: Int
    dynamic let isAdvertiser: Int
    dynamic let isClosed: Int
    dynamic let isMember: Int
    dynamic let name: String
    dynamic let photo100: String
    dynamic let photo200: String
    dynamic let photo50: String
    dynamic let screenName: String
    dynamic let type: String
}

/// TODO: delete
//struct GroupResponse: Codable {
//    let response: Groups
//}
//
//struct Groups: Codable {
//    let count: Int
//    let items: [Group]
//}
//
//struct Group: Codable {
//    let id: Int
//    let isAdmin: Int
//    let isAdvertiser: Int
//    let isClosed: Int
//    let isMember: Int
//    let name: String
//    let photo100: String
//    let photo200: String
//    let photo50: String
//    let screenName: String
//    let type: String
//}
