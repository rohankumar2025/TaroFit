//
//  HeaderView.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import SwiftUI

struct HeaderStruct: View {
    @Environment(\.colorScheme) var colorScheme
    private var headerText: String
    private var showProfilePic: Bool
    
    init(_ headerText: String, showProfilePic: Bool = false) {
        self.headerText = headerText
        self.showProfilePic = showProfilePic
    }
    
    
    var body: some View {
        let darkColor = colorScheme == .light ? Color.black : .white
        let lightColor = colorScheme == .light ? Color.white : .black
        
        ZStack {
            if showProfilePic {
                // Profile pic button
                HStack {
                    Button {
                        withAnimation {
                            
                        }
                    } label : {
                        Circle()
                            .fill(darkColor)
                            .frame(width: screenWidth * 0.1)
                            .padding(.leading)
                    }
                    
                    Spacer()
                }
            }
            
            Text(headerText)
                .font(.system(size: 16, weight: .bold))
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .fill(lightColor)
                )
                .shadow(color: footerPurple.opacity(0.3), radius: 10, x: 0, y: 10)
            
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderStruct("header")
    }
}
