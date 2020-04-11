//
//  FriendsPhotoController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/28.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class FriendsPhotoController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let api = API()
    
    var friendtest: User?
    
    var friend: Friend?
       
    private var userPhotos: Results<Photo>?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupColleciton()
        setupTitle()
        
        api.fetchUserPhoto()
        loadAndUpdateData()
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
    
    private func loadAndUpdateData() {

        guard let realm = try? Realm() else { return }

        userPhotos = realm.objects(Photo.self)

        token = userPhotos?.observe { [weak self] (changes: RealmCollectionChange) in

        guard let collectionView = self?.collectionView else { return }

        switch changes {
            case .initial:
                collectionView.reloadData()

            case .update(_ , let deletions, let insertions, let modifications):

                collectionView.performBatchUpdates({
                    collectionView.insertItems(
                        at: insertions.map({ IndexPath(row: $0, section: 0) }))

                    collectionView.deleteItems(
                        at: deletions.map({ IndexPath(row: $0, section: 0) }))

                    collectionView.reloadItems(
                        at: modifications.map({ IndexPath(row: $0, section: 0) }))
                }, completion: nil)
            case .error(let error):
                fatalError("\(error)")
            }
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
        
        guard let userPhotos = userPhotos?.count else {
            return 0
        }
        return userPhotos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.className, for: indexPath) as? PhotoCell else {
            fatalError()
        }
        guard let photo = userPhotos?[indexPath.row] else {
            fatalError()
        }
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
