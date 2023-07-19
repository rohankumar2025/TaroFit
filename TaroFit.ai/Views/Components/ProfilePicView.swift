//
//  ProfilePicView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct ProfilePicView: View {
    
    private let radius: CGFloat
    
    init(withRadius radius: CGFloat) {
        self.radius = radius
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(white: 0.9))
            
            Image(systemName: "person.circle")
                .font(.system(size: self.radius, weight: .ultraLight))
                .foregroundColor(Color(white: 0.35))
        }
        .frame(width: self.radius, height: self.radius)
    }
}

struct ProfilePicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicView(withRadius: 100)
    }
}
