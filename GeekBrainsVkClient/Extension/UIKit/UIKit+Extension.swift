//
//  UIKit+Extension.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/01/27.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func registerXib(cellClass: UICollectionViewCell.Type) {
        let fileName = cellClass.className
        let reuseId = cellClass.className
        
        register(UINib(nibName: fileName, bundle: nil), forCellWithReuseIdentifier: reuseId)
    }
}

public extension UITableView {
    
    func registerXib(cellClass: UITableViewCell.Type) {
        let fileName = cellClass.className
        let reuseId = cellClass.className
        
        register(UINib(nibName: fileName, bundle: nil), forCellReuseIdentifier: reuseId)
    }
}
