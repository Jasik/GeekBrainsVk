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

class Group: Object, Codable {
    @objc dynamic let id: Int
    @objc dynamic let isAdmin: Int
    @objc dynamic let isAdvertiser: Int
    @objc dynamic let isClosed: Int
    @objc dynamic let isMember: Int
    @objc dynamic let name: String
    @objc dynamic let photo100: String
    @objc dynamic let photo200: String
    @objc dynamic let photo50: String
    @objc dynamic let screenName: String
    @objc dynamic let type: String
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
