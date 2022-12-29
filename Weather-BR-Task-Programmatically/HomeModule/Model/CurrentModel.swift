//
//  CurrentModel.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation



// MARK: - Current
struct Current: Codable {
    let queryCost: Int?
    let latitude, longitude: Double?
    let resolvedAddress, address, timezone: String?
    let tzoffset: Int?
    let days: [CurrentConditions]?
    let currentConditions: CurrentConditions?

}

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
    let datetime: String?
    let datetimeEpoch: Int?
    let temp, feelslike, humidity, dew: Double?
    let precip, precipprob: Double?
    let snow, snowdepth: Double?
    let preciptype: [String]?
    let windgust: Double?
    let windspeed, winddir, pressure, visibility: Double?
    let cloudcover, solarradiation: Double?
    let solarenergy: Double?
    let uvindex: Int?
    let conditions, icon: String?
    let stations: [String]?
    let sunrise: String?
    let sunriseEpoch: Int?
    let sunset: String?
    let sunsetEpoch: Int?
    let moonphase, tempmax, tempmin, feelslikemax: Double?
    let feelslikemin, precipcover: Double?
    let severerisk: Int?
    let currentConditionsDescription: String?

}
