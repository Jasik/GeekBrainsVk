//
//  TestModels.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

struct User {
    let id = UUID()
    let name: String
    let image: [String]
}

struct TesrGroups {
    let groupID: Int
    let groupName, image: String
}

struct News {
    let id = UUID()
    let avatar: String
    let author: String
    let date: String
    let contentText: String
    let image: [String]
}

