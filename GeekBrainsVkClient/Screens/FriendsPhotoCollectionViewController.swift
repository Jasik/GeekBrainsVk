//
//  PhotoCollectionViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    var friend: User?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        guard let friendName = friend?.name else {
            return
        }
        self.navigationItem.title = friendName
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend?.image.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        guard let friendPhoto = friend?.image else {
            fatalError()
        }
        cell.photoImageView.image = UIImage(named: (friendPhoto[indexPath.row]))
        return cell
    }
}
