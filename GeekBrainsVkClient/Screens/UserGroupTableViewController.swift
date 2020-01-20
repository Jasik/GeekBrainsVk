//
//  UserGroupTableViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class UserGroupTableViewController: UITableViewController {

    var myGroups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let groupsTableViewController = segue.source as? GroupsTableViewController else {
                return
            }
            if let indexPath = groupsTableViewController.tableView.indexPathForSelectedRow {
                let myGroup = groupsTableViewController.groups[indexPath.row]
                if !myGroups.contains(where: { $0.groupID == myGroup.groupID }) {
                    myGroups.append(myGroup)
                }
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell

        let myGroup = myGroups[indexPath.row]
        cell.TitleLabel.text = myGroup.groupName
        cell.thumbnailImageView.image = UIImage(named: myGroup.image)
    
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

