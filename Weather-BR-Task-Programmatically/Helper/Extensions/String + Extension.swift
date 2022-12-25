//
//  String + Extension.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 24.12.22.
//

import Foundation

extension String {
    func replace() -> String {
        return replacingOccurrences(of: " ", with: "_")
    }
}
