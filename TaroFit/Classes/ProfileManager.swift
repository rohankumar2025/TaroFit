//
//  ProfileManager.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import Foundation
import SwiftUI

class ProfileManager : ObservableObject {
    // Profile Info
    @Published var username: String = ""
    @Published var profilePicURL: String = ""
    @Published var userData: [String : Dictionary] = ["": [:]]
    @Published var currDate: String = Date().formattedAs("MMMM dd, yyyy")
    
    
    // Navigation Info
    @Published var isLoggedIn: Bool = false
    @Published var currentTab: Int = 0
    @Published var backgroundColor: Color = defaultPurple
}
