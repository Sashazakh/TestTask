//
//  Protocols.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

protocol NetworkServiceInput {
    func isLoginPasswordValid(login: String,
                              password: String,
                              completion: @escaping (Result<RegisterResponse, Error>) -> Void)
    
    func getPayments(token: String,
                     completion: @escaping (Result<PaymentsResponse, Error>) -> Void)
}
