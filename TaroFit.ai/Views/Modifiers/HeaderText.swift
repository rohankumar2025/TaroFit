//
//  HeaderText.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct HeaderText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 30, weight: .semibold))
    }
}

struct HeaderText_Previews: PreviewProvider {
    static var previews: some View {
        Text("Header")
            .modifier(HeaderText())
    }
}
