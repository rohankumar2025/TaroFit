//
//  Tab.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/19/23.
//

import Foundation


enum Tab: String, CaseIterable {
    case dashboard = "Dashboard"
    case nutrition = "Nutrition"
    case plan = "Plan"
    case tools = "Tools"
    
    var name: String { self.rawValue }
}
