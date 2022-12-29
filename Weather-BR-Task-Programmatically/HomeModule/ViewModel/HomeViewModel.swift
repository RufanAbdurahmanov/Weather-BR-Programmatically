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
    
    var successCallback: ((Int)->())?
    var errorCallback: ((String)->())?

    
    private var currentWeather: CurrentConditions!
    private var daysWeather: [CurrentConditions]!
    
    
    private var topViewDatas: TopViewModel?
    
    private var topCollData: [TopCollectionCellModel] = []
    private var daysCollectionViewData: [CurrentConditions] = []
    
    var cityName: String = "Toronto"
    
    
    
    func getCurrentData(fromHomeVC: Bool = true, complete: @escaping ()->()) {
        
        service.getCurrentWeather(city: cityName.replace()) { [weak self] currentModel, errorMessage in
            if let currentModel = currentModel {
                self?.currentWeather = currentModel.currentConditions
                self?.daysWeather = currentModel.days ?? []
                self?.daysCollectionViewData = currentModel.days ?? []
                if !fromHomeVC {
                    self!.successCallback?(0)
                }
            } else {
                self!.errorCallback!(errorMessage!)
            }
            complete()
        }
    }
    
    func topViewData() -> TopViewModel {
        
        if currentWeather != nil {
            topCollData.removeAll()
            
            topCollData.append(TopCollectionCellModel(image: "wind", text1: "Wind", text2: "\(currentWeather?.windspeed ?? 0.0) km/h"))
            topCollData.append(TopCollectionCellModel(image: "drop.fill", text1: "Humidity",
                                                      text2: "\(currentWeather?.humidity ?? 0.0)%"))
            topCollData.append(TopCollectionCellModel(image: "eye.fill", text1: "Visibility",
                                                      text2: "\(Int(currentWeather?.visibility ?? 0.0)) km"))
            topCollData.append(TopCollectionCellModel(image: "rectangle.compress.vertical", text1: "Pressure",
                                                      text2: "\(currentWeather?.pressure ?? 0.0) Pa"))
            topCollData.append(TopCollectionCellModel(image: "cloud.fill", text1: "Cloudy",
                                                      text2: "\(currentWeather?.cloudcover ?? 0.0) %"))
        }
        
        return TopViewModel(temp: "\(self.daysWeather![0].temp ?? 0.0)",
                            feelsLike: "\(self.currentWeather!.feelslike ?? 0.0)",
                            location: "\(self.cityName)",
                            date: "\(self.daysWeather![0].datetime ?? "")",
                            weatherIcon: "\(currentWeather!.icon ?? "")",
                            topCollectionData: topCollData)
    }
    
    
    func numberOFDaysCollView() -> Int {
        return daysCollectionViewData.count
    }
    
    func daysCollectionViewDatas() -> [CurrentConditions] {
        return self.daysWeather
    }
}
