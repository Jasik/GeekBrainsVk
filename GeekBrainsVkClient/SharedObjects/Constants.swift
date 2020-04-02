//
//  Constants.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/21.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

final class Contstants {
    
    static let shared = Contstants()
    
    private init() { }
    
    let baseURL = URL(string: "https://api.vk.com")!
    let authURL = "https://oauth.vk.com"
    let version = "5.103"
    
    
}
