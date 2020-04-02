//
//  GroupsTableViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit
import Kingfisher

class GroupsTableViewController: UITableViewController {
    
    @IBOutlet weak private var searchBar: UISearchBar!
    
    private let api = API()
    
    /// TODO: Delete
    let groupsForTest = [
        TesrGroups(groupID: 1, groupName: "I like Android", image: "android"),
        TesrGroups(groupID: 2, groupName: "Travel", image: "roma"),
        TesrGroups(groupID: 3, groupName: "Japan", image: "japan"),
        TesrGroups(groupID: 4, groupName: "Cars", image: "ferrari")
    ]
    
    var groups: [Group] = []
    
    var filteredData: [TesrGroups]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        
        api.fetchSearched(group: "the station", { [weak self] groups in
            self?.groups = groups
            self?.tableView.reloadData()
        })
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        filteredData = groupsForTest
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// TODO: update filter
//        return filteredData.count
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell

        /// TODO: Delete
//        let group = filteredData[indexPath.row]
//        cell.groupName.text = group.groupName
//        cell.groupThumnailImageView.image = UIImage(named: group.image)
        
        let group = groups[indexPath.row]
        let url = URL(string: group.photo100)
        cell.groupName.text = group.name
        cell.groupThumnailImageView.kf.setImage(with: url)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

/// TODO: Update filter
extension GroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? groupsForTest : groupsForTest.filter({(groupName: TesrGroups) -> Bool in
            return groupName.groupName.range(of: searchText, options: .caseInsensitive) != nil
        })
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
