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
    
    private var apiManager = ApiManager()
    
    private let session = Session.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginWebView.load(apiManager.logIn())
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func transitionAfterReceivingAToken() {
        
        if let tabBarMenu = storyboard?.instantiateViewController(withIdentifier: "TabBarMenu") as? UITabBarController {
            navigationController?.pushViewController(tabBarMenu, animated: true)
        }
    }
    
}

extension Login: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        let token = params["access_token"]

        if let token = token {
            session.token = token
        }
        
        transitionAfterReceivingAToken()

        decisionHandler(.cancel)
    }
}
