//
//  BackgroundView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct BackgroundView: View {
    let width = UIScreen.main.bounds.width * 0.9
    let height = UIScreen.main.bounds.height * 0.8
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(width: width, height: height)
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            BackgroundView()
        }
    }
}
