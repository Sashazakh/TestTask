//
//  PaymentsProtocols.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

protocol PaymentsInput: class {
    func showAlert(title: String, message: String)
    func reloadTable()
}

protocol PaymentsOutput: class {
    func didLoadView()
    func getNumberOfPayemnts() -> Int
    func getModel(at indexPath: IndexPath) -> PaymentModel
    func didLogoutButtonTap()
}
