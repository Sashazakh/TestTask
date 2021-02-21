//
//  LoginPresenter.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

final class LoginPresenter {
    weak var view: LoginInput?
}


extension LoginPresenter: LoginOutput {
    func didLoginButtonTap(login: String?, password: String?) {
        guard let login = login, !login.isEmpty else { view?.showAlert(title: "Error!",
                            message: "Input your login!")
            return
        }
        
        guard let password = password, !password.isEmpty else {
            view?.showAlert(title: "Error!",
                            message: "Input your password!")
            return
        }
        
        NetworkService.shared.isLoginPasswordValid(login: login, password: password) { [weak self] result in
            if let _ = result.error {
                self?.view?.showAlert(title: "Error", message: "Something went wrong...")
            }
            
            if let error = result.data?.error {
                self?.view?.showAlert(title: "Error", message: error.errorMessage)
            }
            
            if let token = result.data?.response?.token {
                self?.view?.successAuth(with: token)
            }
        }
    }
    
    
}
