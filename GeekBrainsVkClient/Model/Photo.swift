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
    dynamic let id: Int
    dynamic let ownerId: Int
    dynamic let sizes: [PhotoSize]
    dynamic let text: String
    dynamic let date: Date
}

class PhotoSize: Codable {
     let height: Int
     let type: String
     let url: String
     let width: Int
}

/// TODO: delete
//struct PhotoResponse: Codable {
//    let response: Photos
//}
//
//struct Photos: Codable {
//    let count: Int
//    let items: [Photo]
//}
//
//struct Photo: Codable {
//    let id: Int
//    let ownerId: Int
//    let sizes: [PhotoSize]
//    let text: String
//    let date: Date
//
//}
//
//struct PhotoSize: Codable {
//    let height: Int
//    let type: String
//    let url: String
//    let width: Int
//}
