//
//  UIImageView + Extension.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 22.12.22.
//

import Foundation
import UIKit



extension UIImageView {
    func loadImage(imageURL: String) {
        if let url = URL(string: "https://raw.githubusercontent.com/visualcrossing/WeatherIcons/main/PNG/1st%20Set%20-%20Color/\(imageURL).png") {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data )
                    }
                }
            }
        }
    }
}
