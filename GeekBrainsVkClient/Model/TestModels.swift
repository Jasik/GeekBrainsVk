//
//  TestModels.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

struct TestModel {
    let id: Int
    let name: String
}

struct TestGroup {
    let groupID: Int
    let groupName: String
}

let friends: [TestModel] = [
    TestModel(id: 1, name: "Jonny Depp")
]

let groups: [TestGroup] = [
    TestGroup(groupID: 1, groupName: "I like Android")
]
