//
//  HomeViewModel.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation


class HomeViewModel {
    
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    
    var currentWeather: Current!
    
    var cityName: String = "Toronto"
    
    func getCurrentData(complete: @escaping ()->()) {
        
        service.getCurrentWeather(city: cityName) { [weak self] currentModel, errorMessage in
            if let currentModel = currentModel {
                self!.currentWeather = currentModel
                //self!.successCallback()
            } else {
                self!.errorCallback!(errorMessage!)
            }
            complete()
        }
        
    }

    
}
