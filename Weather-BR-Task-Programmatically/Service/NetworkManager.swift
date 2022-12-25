//
//  NetworkManager.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation

enum ErrorType: String, Error {
    case networkError = "Make sure you're connected to the internet and try again!"
    case parsingError = "Parsing Error"
}

enum NetworkResponse<T> {
    case success(T)
    case messageFailure(ErrorType)
}


private enum EndPoint: String {
    case trending = "current"
}

enum baseURL: String {
case url = "https://weather.visualcrossing.com/VisualCrossingWebServices/"
}

enum apiKey: String {
    case key = "2RS2L2SRR34FEPUWMFHJQ9XLF"
}

enum Request {
    case trending
    
    var path: String {
        switch self {
        case .trending:
            return EndPoint.trending.rawValue
        }
    }
}

