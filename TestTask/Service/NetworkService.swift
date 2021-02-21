//
//  NetworkService.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import Alamofire
import Foundation

struct Result<DataType, ErrorType> {
    var data: DataType?
    var error: ErrorType?
}

class NetworkService {
    static let shared = NetworkService()
    
    static let baseUrl = "http://82.202.204.94/api/"
    
    private init() {

    }
}

extension NetworkService: NetworkServiceInput {
    func getPayments(token: String, completion: @escaping (Result<PaymentsResponse, Error>) -> Void) {
        let headers: HTTPHeaders = [
            "app-key": "12345",
            "v": "1"
        ]
        
        
        let request = AF.request(NetworkService.baseUrl + "payments?token=\(token)", method: .get, headers: headers)
        
        request.responseDecodable(of: PaymentsResponse.self) { response in
            var result = Result<PaymentsResponse, Error>()

            switch response.result {
            case .success(let data):
                result.data = data
            case .failure(let error):
                result.error = error
            }

            completion(result)
        }
    }
    
    func isLoginPasswordValid(login: String,
                              password: String,
                              completion: @escaping (Result<RegisterResponse, Error>) -> Void) {
        let parameters: [String: String] = [
            "login": login,
            "password": password
        ]
        
        let headers: HTTPHeaders = [
            "app-key": "12345",
            "v": "1"
        ]
        
        
        let request = AF.request(NetworkService.baseUrl + "login", method: .post, parameters: parameters, headers: headers)
    
        request.responseDecodable(of: RegisterResponse.self) { response in
            var result = Result<RegisterResponse, Error>()

            switch response.result {
            case .success(let data):
                result.data = data
            case .failure(let error):
                result.error = error
            }

            completion(result)
        }
    }
}
