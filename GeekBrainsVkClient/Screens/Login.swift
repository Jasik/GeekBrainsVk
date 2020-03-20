//
//  Login.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/03/16.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit
import WebKit

class Login: UIViewController {

    @IBOutlet private weak var loginWebView: WKWebView! {
        didSet {
            loginWebView.navigationDelegate = self
        }
    }
    
    private var api = API()
    
    private let session = Session.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginWebView.load(api.logIn())
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func transitionAfterReceivingAToken() {
        
        if let tabBarMenu = storyboard?.instantiateViewController(withIdentifier: "TabBarMenu") as? UITabBarController {
            navigationController?.pushViewController(tabBarMenu, animated: true)
        }
    }
    
}
