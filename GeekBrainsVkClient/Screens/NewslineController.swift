//
//  NewslineController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/04/23.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class NewslineController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var array = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension NewslineController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    
    
}

extension NewslineController: UITableViewDelegate {
    
}
