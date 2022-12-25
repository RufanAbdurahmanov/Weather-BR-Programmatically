//
//  ApiService.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation 

protocol HomeServiceProtocol {
    func getCurrentWeather(city: String, complete: @escaping (Current? , String?)->())
}


class ApiService: HomeServiceProtocol {
    
    static let shared = ApiService()
    
    func getCurrentWeather(city: String, complete: @escaping (Current? , String?)->()) {
        
        let url = "\(baseURL.url.rawValue)/rest/services/timeline/\(city)?unitGroup=metric&include=\(Request.trending.path)&key=\(apiKey.key.rawValue)&contentType=json"
        
        NetworkRequest.shared.requestAPI(type: Current.self, url: url) { response in
            
            switch response {
            case .success(let t):
                complete(t.self, nil)
            case .messageFailure(let errorType):
                complete(nil, errorType.rawValue)
            }
        }
    }
    
}
