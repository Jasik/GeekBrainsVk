//
//  FriendsTableTableViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/15.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class FriendsTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        let name = friends[indexPath.row].name
        cell.textLabel?.text = name
        return cell
    }
}
