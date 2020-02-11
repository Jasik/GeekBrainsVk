//
//  CustomCell.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/20.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: SpringImage!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageUI()
        setupShadowView()
    }
    
    func setupImageUI() {
        thumbImageView.layer.cornerRadius = thumbImageView.bounds.width / 2
    }
    
    func setupShadowView() {
        shadowView.layer.cornerRadius = shadowView.bounds.width / 2
        shadowView.backgroundColor = .white
        shadowView.layer.borderWidth = 1
        shadowView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shadowView.layer.shadowOffset = .zero
    }
}
