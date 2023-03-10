//
//  WeightView.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import SwiftUI

struct WeightView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var profile: ProfileManager
    
    
    var body: some View {
        let darkColor = colorScheme == .light ? Color.black : .white
        let lightColor = colorScheme == .light ? Color.white : .black
        
        ZStack {
            ScrollView {
                HeaderStruct("Weight Trend")
                
                ZStack {
                    // Rounded rectangle background
                    RoundedRectangle(cornerRadius: 30)
                        .fill(lightColor)
                        .shadow(color: footerPurple.opacity(0.2), radius: 30, x: 10, y: 30)
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .frame(width: screenWidth * 0.95, height: screenHeight * 0.77)
                .padding(.top)
                
                
                
                
                
                Spacer()
            }
            
        }
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        AppHomeView()
            .environmentObject(ProfileManager())
    }
}
