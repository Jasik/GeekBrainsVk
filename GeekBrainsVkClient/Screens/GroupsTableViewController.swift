//
//  GroupsTableViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let groups = [
        Group(groupID: 1, groupName: "I like Android", image: "android"),
        Group(groupID: 2, groupName: "Travel", image: "roma"),
        Group(groupID: 3, groupName: "Japan", image: "japan"),
        Group(groupID: 4, groupName: "Cars", image: "ferrari")
    ]
    
    var filteredData: [Group]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
    }

    private func setupSearchBar() {
        searchBar.delegate = self
        filteredData = groups
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell

        let group = filteredData[indexPath.row]
        cell.groupName.text = group.groupName
        cell.groupThumnailImageView.image = UIImage(named: group.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
extension GroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? groups : groups.filter({(groupName: Group) -> Bool in
            return groupName.groupName.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
}
