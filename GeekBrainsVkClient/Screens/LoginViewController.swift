//
//  LoginViewController.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2019/12/30.
//  Copyright © 2019 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var loginTextField: LoginScreenTextField!
    @IBOutlet private weak var passwordTextField: LoginScreenTextField!
    @IBOutlet private weak var textFieldContainer: UIView!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    private var isLoginAndPasswordNotEmpty: Bool? {
        return !loginTextField.text!.isEmpty && !passwordTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
