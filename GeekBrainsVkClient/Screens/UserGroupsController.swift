//
//  UserGroupsController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/28.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class UserGroupsController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let api = API()
    
    /// TODO: Delete
    var myGroups: [TesrGroups] = []
    private var groups: Results<Group>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTable()
        
        api.fetchGroupList( { [weak self] in
            self?.loadData()
            self?.tableView.reloadData()
        } )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupTitle() {
        navigationItem.title = "My Groups"
    }
    
    func loadData() {
        do {
            let realm = try Realm()
            
            groups = realm.objects(Group.self)
        } catch {
            print(error)
        }
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
                let myGroup = groupsTableViewController.filteredData[indexPath.row]
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
        
        guard let groups = groups?.count else {
            return 0
        }
        return groups
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as? CustomCell else {
            fatalError()
        }
        let group = groups?[indexPath.row]
        let url = URL(string: group!.photo100)
        cell.thumbImageView.kf.setImage(with: url)
        cell.TitleLabel.text = group?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
////            groups.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            if groups!.isEmpty {
//                tableView.separatorStyle = .none
//            }
//        }
//    }
}
