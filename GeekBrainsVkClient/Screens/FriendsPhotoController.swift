//
//  FriendsPhotoController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/28.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit
import Kingfisher

class FriendsPhotoController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let api = API()
    
    var friendtest: User?
    
    var friend: Friend?
       
    var userPhotos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColleciton()
        setupTitle()
        api.fetchUserPhoto({ [weak self] photos  in
            self?.userPhotos = photos
            self?.collectionView.reloadData()
        })
    }
    
    private func setupColleciton() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerXib(cellClass: PhotoCell.self)
    }
    
    private func setupTitle() {
        if let firstName = friend?.firstName, let lastName = friend?.lastName {
            navigationItem.title = lastName + " " + firstName
        }
    }
}

extension FriendsPhotoController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailView = storyboard?.instantiateViewController(identifier: "DetailView") as! DetailView
        if let photos = friend?.photo100 {
            detailView.photos = [photos]
        }
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}

extension FriendsPhotoController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return friend?.image.count ?? 0
        return userPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.className, for: indexPath) as? PhotoCell else {
            fatalError()
        }
//        if let friendPhoto = friend?.image {
//
//            cell.photoImageView.image = UIImage(named: friendPhoto[indexPath.row])
//        }
        let photo = userPhotos[indexPath.row]
        let url = URL(string: photo.sizes[3].url)
        cell.photoImageView.kf.setImage(with: url)
        return cell
    }
}

extension FriendsPhotoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 220)
    }
}
