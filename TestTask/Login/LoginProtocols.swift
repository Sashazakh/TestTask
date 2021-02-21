//
//  LoginProtocols.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

protocol LoginInput: class {
    func showAlert(title: String, message: String)
    func successAuth(with token: String)
}

protocol LoginOutput: class {
    func didLoginButtonTap(login: String?, password: String?)
}
