//
//  CapsuleButton.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/20/23.
//

import Foundation
import SwiftUI

struct CapsuleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .light))
            .padding()
            .background(Capsule().fill(BG_PURPLE))
            .shadow(color: BG_PURPLE.opacity(0.6), radius: 10)
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("Subheader")
            .modifier(CapsuleButton())
    }
}
