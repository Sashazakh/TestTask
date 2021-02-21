//
//  PaymentModel.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation

struct PaymentModel {
    let amount: Double?
    let created: Int?
    let currency: String?
    let desc: String?
    
    init(with rawModel: PaymentRaw) {
        switch rawModel.amount {
        case .string(let stringValue):
            self.amount = Double(stringValue)
        case .double(let doubleValue):
            self.amount = doubleValue
        default:
            self.amount = nil
        }
        
        self.created = rawModel.created
        self.currency = rawModel.currency
        self.desc = rawModel.desc
    }
}
