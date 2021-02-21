//
//  PaymentsPresenter.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import UIKit

final class PaymentsPresenter {
    weak var view: PaymentsInput?
    var token: String!
    
    private var payments: [PaymentModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.view?.reloadTable()
            }
        }
    }
    
    private func handlePayments(with paymentsRaw: [PaymentRaw]) {
        payments = paymentsRaw.map({PaymentModel(with: $0)})
    }
}

extension PaymentsPresenter: PaymentsOutput {
    func didLogoutButtonTap() {
        let scene = UIApplication.shared.connectedScenes.first
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            sceneDelegate.logout()
        }
    }
    
    func getModel(at indexPath: IndexPath) -> PaymentModel {
        return payments[indexPath.row]
    }
    
    func getNumberOfPayemnts() -> Int {
        return payments.count
    }
    
    func didLoadView() {
        NetworkService.shared.getPayments(token: token) { [weak self] (result) in
            if let _ = result.error {
                self?.view?.showAlert(title: "Error", message: "Something went wrong...")
            }
            
            if let error = result.data?.error {
                self?.view?.showAlert(title: "Error", message: error.errorMessage)
            }
            
            if let payments = result.data?.response {
                self?.handlePayments(with: payments)
            }
        }
    }
}
