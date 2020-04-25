//
//  NewslinePhotoCellWithXib.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/04/24.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class NewslinePhotoCellWithXib: UITableViewCell {
    
    @IBOutlet private weak var authorImage: UIImageView!
    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var postDate: UILabel!
    @IBOutlet private weak var postImage: UIImageView!
    @IBOutlet private weak var commentCount: UILabel!
    @IBOutlet private weak var commentImage: UIImageView!
    @IBOutlet private weak var likeCount: UILabel!
    @IBOutlet private weak var likeImage: UIImageView!
    @IBOutlet private weak var repostCount: UILabel!
    @IBOutlet private weak var repostImage: UIImageView!
    @IBOutlet private weak var viewsCount: UILabel!
    @IBOutlet private weak var viewsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
