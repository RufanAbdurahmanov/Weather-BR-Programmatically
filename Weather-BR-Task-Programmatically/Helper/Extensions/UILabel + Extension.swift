//
//  UILabel + Extension.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation
import UIKit


// 2022-22-22

extension UILabel {
    func dateToString(text: String, short: Bool = true) {
        
        let fullString =  text
        let fullStringArray = fullString.map { String($0) }
        
        var monthString = ""
        var dayString = ""
        if fullStringArray.count == 10 {
            monthString.append(fullStringArray[5].lowercased())
            monthString.append(fullStringArray[6].lowercased())
            dayString.append(fullStringArray[8].lowercased())
            dayString.append(fullStringArray[9].lowercased())
        }
        
        var monthByName: String?
        
        
        if short {
            if monthString == "01" {
                monthByName = "Jan"
            } else if monthString == "02" {
                monthByName = "Feb"
            } else if monthString == "03" {
                monthByName = "Mar"
            } else if monthString == "04" {
                monthByName = "Apr"
            } else if monthString == "05" {
                monthByName = "May"
            } else if monthString == "06" {
                monthByName = "June"
            } else if monthString == "07" {
                monthByName = "July"
            } else if monthString == "08" {
                monthByName = "Aug"
            } else if monthString == "09" {
                monthByName = "Sep"
            } else if monthString == "10" {
                monthByName = "Oct"
            } else if monthString == "11" {
                monthByName = "Nov"
            } else if monthString == "12" {
                monthByName = "Dec"
            } else {
                monthByName = "xx"
            }
        } else {
            if monthString == "01" {
                monthByName = "January"
            } else if monthString == "02" {
                monthByName = "Febuary"
            } else if monthString == "03" {
                monthByName = "March"
            } else if monthString == "04" {
                monthByName = "April"
            } else if monthString == "05" {
                monthByName = "May"
            } else if monthString == "06" {
                monthByName = "June"
            } else if monthString == "07" {
                monthByName = "July"
            } else if monthString == "08" {
                monthByName = "August"
            } else if monthString == "09" {
                monthByName = "September"
            } else if monthString == "10" {
                monthByName = "October"
            } else if monthString == "11" {
                monthByName = "November"
            } else if monthString == "12" {
                monthByName = "December"
            } else {
                monthByName = "xx"
            }
        }
        
        
        
        
        let fullDateString = "\(monthByName!) \(dayString)"
        
        self.text = fullDateString
    }
}
