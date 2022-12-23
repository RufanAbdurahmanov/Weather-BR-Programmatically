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

