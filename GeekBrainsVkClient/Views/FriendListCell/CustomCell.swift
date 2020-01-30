//
//  CustomCell.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/20.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    
//    var friend: User? {
//        didSet {
//            guard let friend = friend else {
//                return
//            }
//            thumbnailImageView.image = UIImage(named: friend.image.first ?? "00")
//            TitleLabel.text = friend.name
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageUI()
        setupShadowView()
    }
    
    func setupImageUI() {
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
    }
    
    func setupShadowView() {
        shadowView.layer.cornerRadius = shadowView.bounds.width / 2
        shadowView.backgroundColor = .white
        shadowView.layer.borderWidth = 1
        shadowView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shadowView.layer.shadowOffset = .zero
    }
}
