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
    dynamic var id: Int = 0
    dynamic var isAdmin: Int = 0
    dynamic var isAdvertiser: Int = 0
    dynamic var isClosed: Int = 0
    dynamic var isMember: Int = 0
    dynamic var name: String = ""
    dynamic var photo100: String = ""
    dynamic var photo200: String = ""
    dynamic var photo50: String = ""
    dynamic var screenName: String = ""
    dynamic var type: String = ""
    
    override static func primaryKey() -> String? {
           return "id"
    }
}
