//
//  Header.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/19/23.
//

import SwiftUI

struct Header: View {
    var title: String
    var dateText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dateText)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                
                Text(title)
                    .modifier(HeaderText())
            }
            
            Spacer()
            
            ProfilePicView(withRadius: 40)
        }
        .padding(.horizontal)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Dashboard", dateText: "11 Jun 2018")
    }
}
