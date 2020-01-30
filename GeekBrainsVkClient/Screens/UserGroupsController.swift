//
//  UserGroupsController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/28.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class UserGroupsController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var myGroups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.separatorStyle = myGroups.isEmpty ? .none : .singleLine
    }
    
    private func setupTitle() {
        navigationItem.title = "My Groups"
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerXib(cellClass: CustomCell.self)
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
}

extension UserGroupsController: UITableViewDelegate { }

extension UserGroupsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else {
            fatalError()
        }
        let myGroup = myGroups[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: myGroup.image)
        cell.TitleLabel.text = myGroup.groupName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if myGroups.isEmpty {
                tableView.separatorStyle = .none
            }
        }
    }
}
