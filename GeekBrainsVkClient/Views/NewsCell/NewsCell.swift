//
//  NewsCell.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/31.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet private weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        }
    }
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var contentTextLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var news: News? {
        didSet {
            guard let news = news else { return }
            avatarImageView.image = UIImage(named: news.avatar)
            authorLabel.text = news.author
            dateLabel.text = news.date
            contentTextLabel.text = news.contentText
            newsImages = news.image
        }
    }
    
    private var newsImages: [String]?
    
    var commentButtomConnection: (() -> Void)?
    var shareButtonConnection: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerXib(cellClass: NewsImageCellCollectionViewCell.self)
    }
    
    @IBAction func commentButton(_ sender: UIButton) {
        commentButtomConnection?()
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
        shareButtonConnection?()
    }
}

extension NewsCell: UICollectionViewDelegate { }

extension NewsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let imageCount = newsImages?.count else {
            return 0
        }
        return imageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsImageCellCollectionViewCell.className, for: indexPath) as? NewsImageCellCollectionViewCell else {
            fatalError()
        }
        guard let newsImage = newsImages?[indexPath.row] else {
            fatalError()
        }
        cell.newImageView.image = UIImage(named: newsImage)
        return cell
    }
}

extension NewsCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return size
    }
}
