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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupObserver()
    }
   
    @objc func keyboardWasShow(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    private func setup() {
        let adaptiveBorderColor = UIColor(named: "border_color")
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = adaptiveBorderColor?.cgColor
        textFieldContainer.layer.cornerRadius = 10
        
        signInButton.layer.cornerRadius = 10
        signInButton.isEnabled = isLoginAndPasswordNotEmpty!
        signInButton.backgroundColor = UIColor(named: isLoginAndPasswordNotEmpty! ? "activeButtonColor" : "noActiveButtonColor")
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
