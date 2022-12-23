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
        
        let url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(city)?unitGroup=metric&include=current&key=2RS2L2SRR34FEPUWMFHJQ9XLF&contentType=json"
        
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
