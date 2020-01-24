//
//  TestModels.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

struct User {
    let id: Int
    let name: String
    let image: [String]
}

struct Group {
    let groupID: Int
    let groupName, image: String
}
