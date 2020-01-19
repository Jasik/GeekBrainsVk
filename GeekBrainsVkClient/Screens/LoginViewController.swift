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
    
    private var isLoginAndPasswordNotEmpty: Bool {
        guard let loginIsEmpty = loginTextField.text?.isEmpty, let passwordIsEmpty = passwordTextField.text?.isEmpty else {
            return false
        }
        return !loginIsEmpty && !passwordIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dismissTap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(dismissTap)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupObserver()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeObserver()
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        guard let loginText = loginTextField.text, let passwordText = passwordTextField.text  else {
            return
        }
        print("login: \(loginText)")
        print("password: \(passwordText)")
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkLoginResult = checkLogin()
        if identifier == "LoginSuccess" {
            if !checkLoginResult {
                showAlert(title: "Ошибка!", message: !isLoginAndPasswordNotEmpty ? "Поля Логин и пароль не были введены!" : "Непрвильный логин или пароль!")
            }
        }
        return checkLoginResult
    }
    
    private func checkLogin() -> Bool {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return false }
        return login == "Login" && password == "12345"
    }
    
    private func setup() {
        let adaptiveBorderColor = UIColor(named: "border_color")
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = adaptiveBorderColor?.cgColor
        textFieldContainer.layer.cornerRadius = 10
        
        signInButton.layer.cornerRadius = 10
        signInButton.isEnabled = isLoginAndPasswordNotEmpty
        signInButton.backgroundColor = UIColor(named: isLoginAndPasswordNotEmpty ? "activeButtonColor" : "noActiveButtonColor")
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
extension LoginViewController {
    func showAlert(title: String, message: String) {
        let alertControllert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertControllert.addAction(action)
        present(alertControllert, animated: true, completion: nil)
    }
}
