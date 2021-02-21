//
//  RawModel.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Foundation


struct RegisterResponse: Decodable {
    let status: String
    let error: ErrorType?
    let response: ResponseType?
    
    private enum CodingKeys: String, CodingKey {
        case status = "success"
        case error = "error"
        case response = "response"
    }
}

struct ResponseType: Decodable {
    let token: String
    
    private enum CodingKeys: String, CodingKey {
        case token = "token"
    }
}

struct ErrorType: Decodable {
    let errorCode: Int
    let errorMessage: String
    
    private enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case errorMessage = "error_msg"
    }
}

struct PaymentsResponse: Decodable {
    let response: [PaymentRaw]?
    let result: String
    let error: ErrorType?
    
    private enum CodingKeys: String, CodingKey {
        case response = "response"
        case result = "success"
        case error = "error"
    }
}

struct PaymentRaw: Decodable {
    let amount: MultiplyValues?
    let created: Int?
    let currency: String?
    let desc: String?
    
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case created = "created"
        case currency = "currency"
        case desc = "desc"
    }
}

enum MultiplyValues: Decodable {
    
    case double(Double), string(String)
    
    init(from decoder: Decoder) throws {
        if let double = try? decoder.singleValueContainer().decode(Double.self) {
            self = .double(double)
            return
        }
        
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        
        throw QuantumError.missingValue
    }
    
    enum QuantumError:Error {
        case missingValue
    }
}
