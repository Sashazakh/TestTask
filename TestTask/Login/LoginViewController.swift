//
//  LoginViewController.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import UIKit
import PinLayout

final class LoginViewController: UIViewController {
    var presenter: LoginOutput!
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Input your login and password!"
        label.textAlignment = .center
        return label
    }()
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Login...",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Password...",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(didLoginButtonTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupLayout()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(welcomeLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    // MARK: Setup layout
    
    private func setupLayout() {
        setupWelcomeLabelLayout()
        setupLoginTextFieldLayout()
        setupPasswordTextFieldLayout()
        setupLoginButtonLayout()
    }
    
    
    private func setupWelcomeLabelLayout() {
        welcomeLabel.pin
            .top(10%)
            .width(85%)
            .height(5%)
            .hCenter()
    }
    
    private func setupLoginTextFieldLayout() {
        loginTextField.pin
            .below(of: welcomeLabel)
            .hCenter()
            .width(85%)
            .height(5%)
    }
    
    private func setupPasswordTextFieldLayout() {
        passwordTextField.pin
            .below(of: loginTextField)
            .hCenter()
            .width(85%)
            .height(5%)
    }
    
    private func setupLoginButtonLayout() {
        loginButton.pin
            .below(of: passwordTextField)
            .marginTop(5%)
            .hCenter()
            .width(85%)
            .height(5%)
    }
    
    // MARK: Actions
    
    @objc
    private func didLoginButtonTap(_ sender: UIButton) {
        presenter.didLoginButtonTap(login: loginTextField.text, password: passwordTextField.text)
    }
}

extension LoginViewController: LoginInput {
    func successAuth(with token: String) {
        let paymentsVC = PaymentsContainer.assemble(with: PaymentContext(token: token)).viewController
        
        let navigationVC = UINavigationController(rootViewController: paymentsVC)
        navigationVC.modalPresentationStyle = .fullScreen
        
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Оk", style: .default, handler: nil))
                present(alert, animated: true)
    }
}
