//
//  FriendListTableTableViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class FriendListTableTableViewController: UITableViewController {
    
    private let friends: [User] = [
        User(id: 3, name: "Rogozhkin Vladimir", image: ["00", "00", "00"]),
        User(id: 1, name: "Jonny Depp", image: ["j01", "j02", "j03"]),
        User(id: 2, name: "Bred Pitt", image: ["b01", "b02", "b03"]),
        User(id: 4, name: "Armano", image: ["00", "00", "00"])
    ]
    private var friendsDictionary = [String: [User]]()
    private var friendsSectionName = [String]()

    private var selectedSection = 0
    private var selectedCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        getSectionTitle()
        sortSectionTitle()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionName.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = friendsSectionName[section]
        if let friends = friendsDictionary[key] {
            return friends.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        let key = friendsSectionName[indexPath.section]
        if let friends = friendsDictionary[key] {
            let friend = friends[indexPath.row]
            cell.TitleLabel.text = friend.name
            cell.thumbnailImageView.image = UIImage(named: friend.image.first ?? "00")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedCell = indexPath.row
        performSegue(withIdentifier: "toPhoto", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhoto" {
            let key = friendsSectionName[selectedSection]
            if let friends = friendsDictionary[key] {
                let photoCollectionView = segue.destination as! FriendsPhotoCollectionViewController
                photoCollectionView.friend = friends[selectedCell]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSectionName[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSectionName
    }
}

extension FriendListTableTableViewController {
    private func getSectionTitle() {
        for friend in friends {
            let friendKey = String(friend.name.prefix(1))
            if var friendValues = friendsDictionary[friendKey] {
                friendValues.append(friend)
                friendsDictionary[friendKey] = friendValues
            } else {
                friendsDictionary[friendKey] = [friend]
            }
        }
    }
    
    private func sortSectionTitle() {
        friendsSectionName = [String](friendsDictionary.keys)
        friendsSectionName = friendsSectionName.sorted(by: { $0 < $1 })
    }
}
