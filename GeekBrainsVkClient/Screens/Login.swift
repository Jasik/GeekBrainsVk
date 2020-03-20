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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
