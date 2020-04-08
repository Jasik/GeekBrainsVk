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
    dynamic var id: Int = 0
    dynamic var firstName: String = ""
    dynamic var lastName: String = ""
    dynamic var isClosed: Bool = false
    dynamic var canAccessClosed: Bool = false
    dynamic var nickname: String = ""
    dynamic var photo100: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
