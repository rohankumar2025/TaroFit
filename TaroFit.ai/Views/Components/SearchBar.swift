//
//  SearchBar.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/20/23.
//

import SwiftUI

struct SearchBar: View {
    private let defaultText: String
    @Binding var searchQuery: String
    
    init(_ defaultText: String, text: Binding<String>) {
        self.defaultText = defaultText
        self._searchQuery = text
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(.gray.opacity(0.2))
            
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                
                TextField(self.defaultText, text: self.$searchQuery)
                    .font(.system(size: 14))
                    .padding(10)
                    .foregroundColor(.black)
                
                if self.searchQuery != "" {
                    Button {
                        self.searchQuery = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
            
        }
        .frame(maxHeight: 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar("Default Text", text: .constant(""))
    }
}
