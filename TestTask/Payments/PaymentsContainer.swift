//
//  PaymentsContainer.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

final class PaymentsContainer {
    let viewController: PaymentsViewController
    

    class func assemble(with context: PaymentContext) -> PaymentsContainer {
        let vc = PaymentsViewController()
        
        let presenter = PaymentsPresenter()

        vc.presenter = presenter
        presenter.view = vc
        presenter.token = context.token
        return PaymentsContainer(view: vc)
    }

    private init(view: PaymentsViewController) {
        self.viewController = view
    }
}

struct PaymentContext {
    var token: String
}
