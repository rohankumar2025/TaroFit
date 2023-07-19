//
//  SubHeaderText.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct SubHeaderText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 22, weight: .semibold))
    }
}

struct SubHeaderText_Previews: PreviewProvider {
    static var previews: some View {
        Text("Subheader")
            .modifier(SubHeaderText())
    }
}
