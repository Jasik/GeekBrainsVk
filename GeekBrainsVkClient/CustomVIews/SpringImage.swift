//
//  SpringImage.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/02/05.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class SpringImage: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        tappedImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(
            withDuration: 0.9,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 10,
            options: .curveEaseInOut,
            animations: {
                tappedImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }

}
