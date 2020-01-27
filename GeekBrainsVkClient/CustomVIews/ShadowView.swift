//
//  ShadowView.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/23.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable
    var shadowViewColor: UIColor = UIColor.white {
        didSet {
            updateShadowColor()
        }
    }
    
    @IBInspectable
    var shadowViewRadius: CGFloat = 0 {
        didSet {
            updateShadowRadius()
        }
    }
    
    @IBInspectable
    var shadowViewOpacity: Float = 0 {
        didSet {
            updateShadowOpacity()
        }
    }
    
    private func updateShadowColor() {
        self.layer.shadowColor = shadowViewColor.cgColor
    }
    
    private func updateShadowRadius() {
        self.layer.shadowRadius = shadowViewRadius
    }
    
    private func updateShadowOpacity() {
        self.layer.shadowOpacity = shadowViewOpacity
    }
}
