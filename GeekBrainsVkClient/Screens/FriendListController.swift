//
//  FriendListController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/27.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class FriendListController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let friends: [User] = [
           User(name: "Rogozhkin Vladimir", image: ["00", "00", "00"]),
           User(name: "Jonny Depp", image: ["j01", "j02", "j03"]),
           User(name: "Bred Pitt", image: ["b01", "b02", "b03"]),
           User(name: "Armano", image: ["00", "00", "00"]),
           User(name: "Jonny Pit", image: ["b01", "j02", "j03"])
    ]
    private var filteredData: [String: [User]] = [:]
    private var friendsDictionary = [String: [User]]()
    private var friendsSectionName = [String]()
    
    private var selectedSection = 0
    private var selectedCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTable()
        getSectionTitle()
        sortSectionTitle()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerXib(cellClass: CustomCell.self)
    }
    
    private func setupTitle() {
        navigationItem.title = "Friends"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhoto" {
            let key = friendsSectionName[selectedSection]
            if let friends = friendsDictionary[key] {
                let friendsPhotoController = segue.destination as! FriendsPhotoController
                friendsPhotoController.friend = friends[selectedCell]
            }
        }
    }
}

extension FriendListController: UITableViewDelegate { }

extension FriendListController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = friendsSectionName[section]
        if let friends = friendsDictionary[key] {
            return friends.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else {
            fatalError()
        }
        let key = friendsSectionName[indexPath.section]
        if let friends = friendsDictionary[key] {
            let friend = friends[indexPath.row]
            cell.thumbnailImageView.image = UIImage(named: friend.image.first ?? "00")
            cell.TitleLabel.text = friend.name
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsSectionName[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSectionName
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedCell = indexPath.row
        performSegue(withIdentifier: "toPhoto", sender: nil)
    }
}

extension FriendListController {
    
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
