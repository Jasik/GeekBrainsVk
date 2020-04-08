//
//  FriendListController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/27.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class FriendListController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let api = API()
    
    /// TODO: Delete
    private let friendstest: [User] = [
           User(name: "Rogozhkin Vladimir", image: ["00", "00", "00"]),
           User(name: "Jonny Depp", image: ["j01", "j02", "j03"]),
           User(name: "Bred Pitt", image: ["b01", "b02", "b03"]),
           User(name: "Armano", image: ["00", "00", "00"]),
           User(name: "Jonny Pit", image: ["b01", "j02", "j03"])
    ]
    
    private var friends: Results<Friend>?
    
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
        setupSearchBar()
        
        api.fetchFriendsList({ [weak self] in
            self?.loadData()
            self?.tableView.reloadData()
        })
        
        tableView.reloadData()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerXib(cellClass: CustomCell.self)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupTitle() {
        navigationItem.title = "Friends"
    }
    
    func loadData() {
        do {
            let realm = try Realm()
                
            friends = realm.objects(Friend.self)
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPhoto" {
            let key = friendsSectionName[selectedSection]
            if let friends = friendsDictionary[key] {
                let friendsPhotoController = segue.destination as! FriendsPhotoController
                friendsPhotoController.friendtest = friendstest[selectedCell]
            }
        }
    }
}

extension FriendListController: UITableViewDelegate { }

extension FriendListController: UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return friendsSectionName.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let key = friendsSectionName[section]
//        if let friends = filteredData[key] {
//            return friends.count
//        }
//        return 0
        
        guard let friends = friends?.count else {
            return 0
        }
        
        return friends
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else {
            fatalError()
        }
//        let key = friendsSectionName[indexPath.section]
//        if let friends = filteredData[key] {
//            print("friend test  \(friends)")
//            let friend = friends[indexPath.row]
//            let url = URL(string: friend.photo100)
//            let name = friend.lastName + friend.firstName
////            cell.thumbImageView.image = UIImage(named: friend.image.first ?? "00")
//            cell.thumbImageView.kf.setImage(with: url)
//            cell.TitleLabel.text = name
//            cell.accessoryType = .disclosureIndicator
//        }
        
        guard let friend = friends?[indexPath.row] else {
            fatalError()
        }
        
        let url = URL(string: friend.photo100)
        let name = friend.lastName + " " + friend.firstName

        cell.TitleLabel.text = name
        cell.thumbImageView.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return friendsSectionName[section]
//    }
//
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return friendsSectionName
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedCell = indexPath.row
        performSegue(withIdentifier: "toPhoto", sender: nil)
    }
}

extension FriendListController {
    
    private func getSectionTitle() {
        
        for friend in friendstest {
//          let friendKey = String(friend.lastName.prefix(1))
            let friendKey = String(friend.name.prefix(1))
            if var friendValues = friendsDictionary[friendKey] {
                friendValues.append(friend)
                friendsDictionary[friendKey] = friendValues
            } else {
                friendsDictionary[friendKey] = [friend]
            }
        }
        filteredData = friendsDictionary
        tableView.reloadData()
    }
    
    private func sortSectionTitle() {
        
        friendsSectionName.removeAll()
        
        for key in filteredData.keys {
            if filteredData[key]?.count != 0 {
                friendsSectionName.append(key)
                friendsSectionName = friendsSectionName.sorted(by: { $0 < $1 })
            }
        }
    }
}

extension FriendListController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData.removeAll()
        
        filteredData = searchText.isEmpty ? friendsDictionary : friendsDictionary.compactMapValues { user in
//            user.filter({(friend: Friend) -> Bool in
//            let name = friend.lastName + friend.firstName
//            return name.range(of: searchText, options: .caseInsensitive) != nil
            user.filter({(friend: User) -> Bool in
                return friend.name.range(of: searchText, options: .caseInsensitive) != nil
            })
        }
        sortSectionTitle()
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
