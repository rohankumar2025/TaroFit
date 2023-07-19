//
//  DateExtensions.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/19/23.
//

import Foundation

extension Date {
    func formatToText() -> String {
        let date = DateFormatter()
        date.dateFormat = "MMMM dd"
        
        return date.string(from: self)
    }
}
