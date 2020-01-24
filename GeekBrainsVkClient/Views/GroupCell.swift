//
//  GroupCell.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/21.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupThumnailImageView: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
