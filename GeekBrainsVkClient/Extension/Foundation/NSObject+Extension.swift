//
//  NSObject+Extension.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/27.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

public extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
