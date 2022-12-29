//
//  NetworkRequest.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation
import Alamofire


enum NetworkMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


class NetworkRequest {
    static let shared = NetworkRequest()
    
    func requestAPI<T: Decodable>(type: T.Type, method: NetworkMethods = .get, url: String, params: [String: Any] = [:], completion: @escaping(NetworkResponse<T>)->()) {
        AF.request(url,
                   method: HTTPMethod(rawValue: method.rawValue),
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil).responseData { response in
            switch response.result {
            case .success( let value):
                self.parse(value: value) { response in
                    completion(response)
                }
            case .failure(let error):
                print("Network Errorr: \(error.localizedDescription)")
                completion(.messageFailure(.networkError))
            }
        }
    }
    
    private func parse<T: Decodable>(value: Data, completion: @escaping(NetworkResponse<T>)->()) {
        do {
            let jsonData = try JSONDecoder().decode(T.self, from: value)
            completion(.success(jsonData))
        } catch {
            print("Parsing Errorr: \(error.localizedDescription)")
            completion(.messageFailure(.parsingError))
        }
    }
}
