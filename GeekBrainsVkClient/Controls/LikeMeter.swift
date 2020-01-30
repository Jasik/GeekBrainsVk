//
//  LikeMeter.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/24.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class LikeMeter: UIControl {
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        return recognizer
    }()
        
    @objc func onTap() {
        if flag == false {
            likeCount.text = "0"
            likeImage.tintColor = .gray
            flag = true
        } else if flag == true {
            likeCount.text = "1"
            likeImage.tintColor = .red
            flag = false
        }
    }
        
    private var flag: Bool = false
    
    fileprivate let likeCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.text = "0"
        label.textColor = .gray
        return label
    }()
           
    fileprivate let likeImage: UIImageView = {
        let image = UIImage(systemName: "suit.heart.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.tintColor = .gray
        return imageView
    }()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        addGestureRecognizer(tapGestureRecognizer)
    }
        
    fileprivate func setupUI() {
        self.addSubview(likeCount)
        likeCount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        likeCount.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(likeImage)
        likeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        likeImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        likeImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        likeImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
    }
}
