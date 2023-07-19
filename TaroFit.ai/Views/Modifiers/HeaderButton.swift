//
//  HeaderButton.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct HeaderButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 25, weight: .medium))
    }
}

struct HeaderButton_Previews: PreviewProvider {
    static var previews: some View {
        Image(systemName: "line.3.horizontal")
            .modifier(HeaderButton())
    }
}
