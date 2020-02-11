//
//  FriendsPhotoController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/28.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class FriendsPhotoController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var friend: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColleciton()
        setupTitle()
    }
    
    private func setupColleciton() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerXib(cellClass: PhotoCell.self)
    }
    
    private func setupTitle() {
        if let friendName = friend?.name {
            navigationItem.title = friendName
        }
    }
}

extension FriendsPhotoController: UICollectionViewDelegate { }

extension FriendsPhotoController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend?.image.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.className, for: indexPath) as? PhotoCell else {
            fatalError()
        }
        if let friendPhoto = friend?.image {
            cell.photoImageView.image = UIImage(named: friendPhoto[indexPath.row])
        }
        return cell
    }
}

extension FriendsPhotoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 220)
    }
}
