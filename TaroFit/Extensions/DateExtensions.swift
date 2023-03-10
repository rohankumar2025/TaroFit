//
//  DateExtensions.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import Foundation
extension Date {
    func formattedAs(_ format: String = "MM/dd/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
