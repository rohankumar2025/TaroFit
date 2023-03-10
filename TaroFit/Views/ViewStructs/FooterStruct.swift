//
//  FooterStruct.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import SwiftUI

struct FooterStruct: View {
    @EnvironmentObject var profile: ProfileManager
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack(alignment: .bottom) {
                // Bottom rounded rectangle
                ZStack {
                    VStack(spacing: 0) {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: screenWidth * 1.05, height: screenHeight * 0.11)
                            
                    }
                    .foregroundColor(footerColor)

                }
                
                // All buttons in footer
                HStack(alignment: .top) {
                    // Array of icon names
                    let buttons = ["house.fill", "chart.xyaxis.line", "plus", "shuffle", "calendar"]
                    

                    ForEach(0..<buttons.count, id: \.self) { i in
                        Spacer()

                        // For all icons that are not plus sign
                        if i != 2 {
                        // Draws icon image (changes color and size when tab is opened)
                        let isSelected = profile.currentTab == i
                        
                            Image(systemName: buttons[i])
                                .font(.system(size: isSelected ? 22 : 20, weight: .semibold))
                                .foregroundColor(isSelected ? .white : .white.opacity(0.4))
                                .padding()
                                .onTapGesture {
                                    withAnimation {
                                        profile.currentTab = i
                                        //navInfo.showSettingsView = false
                                        //navInfo.displayPlusView = false
                                    }
                                }
                                .frame(width: screenWidth * 0.08)
                        }
                        // For plus sign
                        else {
                            ZStack {
                                Circle()
                                    .fill(footerPurple)
                                    .frame(width: screenWidth * 0.2, height: screenWidth * 0.2)
                                    .shadow(color: footerPurple.opacity(0.7), radius: 35, x: 0, y: 15)
                                
                                Button {
                                    withAnimation {
                                        //navInfo.displayPlusView.toggle()
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                        //.rotationEffect(Angle(degrees: navInfo.displayPlusView ? -45 : 0))
                                }
      
                            }
                            .offset(y: -screenHeight * 0.03)

                            
                        }

                        Spacer()
                    }
                
                }
                .frame(width: screenWidth * 0.97)
                
            
            }
            .frame(width: screenWidth, height: screenHeight, alignment: .bottom)
            .shadow(color: footerColor.opacity(0.3), radius: 30, x: 0, y: 0)
        }
    }
}

struct FooterStruct_Previews: PreviewProvider {
    static var previews: some View {
        AppHomeView()
            .environmentObject(ProfileManager())
    }
}
