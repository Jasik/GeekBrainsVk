//
//  Session.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/13.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

class Session {
    
    static let shared = Session()
    
    private init() {
        
    }
    
    var token: String = ""
    var userId: Int = 0
}
