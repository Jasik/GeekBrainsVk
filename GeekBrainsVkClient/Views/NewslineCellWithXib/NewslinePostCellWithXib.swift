//
//  NewslinePostCellWithXib.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/04/24.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class NewslinePostCellWithXib: UITableViewCell {

    @IBOutlet private weak var authorImage: UIImageView!
    @IBOutlet private weak var authorName: UILabel!
    @IBOutlet private weak var postTime: UILabel!
    @IBOutlet private weak var postText: UITextView!
    @IBOutlet private weak var commentCount: UILabel!
    @IBOutlet private weak var commentImage: UIImageView!
    @IBOutlet private weak var likeCount: UILabel!
    @IBOutlet private weak var likeImage: UIImageView!
    @IBOutlet private weak var viewsCount: UILabel!
    @IBOutlet private weak var viewsImage: UIImageView!
    @IBOutlet private weak var repostCount: UILabel!
    @IBOutlet private weak var repostImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
