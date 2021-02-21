//
//  LoginContainer.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

class LoginContainer {
    let viewController: LoginViewController
    

    class func assemble() -> LoginContainer {
        let vc = LoginViewController()
        
        let presenter = LoginPresenter()

        vc.presenter = presenter
        presenter.view = vc
        return LoginContainer(view: vc)
    }

    private init(view: LoginViewController) {
        self.viewController = view
    }
}
