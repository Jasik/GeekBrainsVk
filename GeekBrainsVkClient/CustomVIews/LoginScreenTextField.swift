//
//  LoginScreenTextField.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/04.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

open class LoginScreenTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
}
