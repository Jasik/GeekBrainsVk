//
//  Photo.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/28.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoResponse: Codable {
    let response: Photos
}

class Photos: Codable {
    let count: Int
    let items: [Photo]
}

@objcMembers class Photo: Object, Codable {
    dynamic var id: Int = 0
    dynamic var ownerId: Int = 0
    dynamic var sizes = List<PhotoSize>()
    dynamic var text: String = ""
    dynamic var date: Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

@objcMembers class PhotoSize: Object, Codable {
    dynamic var height: Int = 0
    dynamic var type: String = ""
    dynamic var url: String = ""
    dynamic var width: Int = 0
}
