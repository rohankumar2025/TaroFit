//
//  AppView.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import SwiftUI

struct AppHomeView: View {
    @EnvironmentObject var profile: ProfileManager
    
    
    var body: some View {
        ZStack {
            profile.backgroundColor.opacity(0.5).ignoresSafeArea()
            
            TabView(selection: $profile.currentTab) {
                HomeView().tag(0)
                WeightView().tag(1)
                CoreView().tag(3)
                CalendarView().tag(4)
            }
            .tabViewStyle(.page)
            .ignoresSafeArea()
            
            FooterStruct()
                .environmentObject(profile)
            
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppHomeView()
            .environmentObject(ProfileManager())
    }
}
