//
//  SplashView.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/02/04.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class SplashView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "BackgroundDarkAndLightColor")
        
        let layer = CAReplicatorLayer()
        layer.frame = CGRect(x: 0,y: 0,width: 50,height: 10)
        let dot = CALayer()
        dot.frame = CGRect(x: 0,y: 0,width: 10,height: 10)
        dot.backgroundColor = UIColor(named: "noActiveButtonColor")?.cgColor
        dot.cornerRadius = dot.frame.width / 2
        layer.addSublayer(dot)
        layer.instanceCount = 3
        layer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.duration = 1
        animation.repeatCount = .infinity
        dot.add(animation, forKey: nil)
        layer.instanceDelay = animation.duration / Double(layer.instanceCount)
        view.layer.addSublayer(layer)
        layer.position = CGPoint(x: self.view.layer.bounds.midX, y: self.view.layer.bounds.midY)
    }
}
