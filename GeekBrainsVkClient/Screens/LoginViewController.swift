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
  
    private func setupObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
}
