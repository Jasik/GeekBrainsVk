//
//  NewslinePhotoCell.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/04/23.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class NewslinePhotoCell: UITableViewCell {
    
    fileprivate let authorImage: UIImageView = {
        let image = UIImage(systemName: "person.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.tintColor = .gray
        return imageView
    }()
    
    fileprivate let authorName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Author"
        label.textColor = UIColor(named: "author_name_color")
        return label
    }()
    
    fileprivate let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "00 Апр в 00:00"
        label.textColor = UIColor.gray
        return label
    }()
    
    fileprivate let photo: UIImageView = {
        let image = UIImage(named: "00.jpg")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        return imageView
    }()

    fileprivate let commentCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "0"
        label.textColor = UIColor.gray
        return label
    }()
    
    fileprivate let commentCountImage: UIImageView = {
        let image = UIImage(systemName: "bubble.left")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.tintColor = UIColor.gray
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
