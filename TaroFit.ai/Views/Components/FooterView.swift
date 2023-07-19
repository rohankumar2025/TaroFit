//
//  FooterView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct FooterView: View {
    @Binding var tab: String
    @State private var searchQuery: String = ""
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Rectangle()
                    .fill(Color(white: 0.95).opacity(0.7))
                    .frame(height: 1)
                
                searchBar
                
                HStack {
                    footerButton(usingSystemName: "rectangle.grid.2x2", forLabel: "Dashboard")
                    footerButton(usingSystemName: "carrot", forLabel: "Nutrition")
                    
                    plusButton
                    
                    footerButton(usingSystemName: "list.clipboard", forLabel: "Plan")
                    footerButton(usingSystemName: "wrench.adjustable", forLabel: "Tools")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxHeight: 0, alignment: .bottom)
    }
    
    private var plusButton: some View {
        Button {
            
        } label: {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(BG_PURPLE)
                .font(.system(size: 50, weight: .ultraLight))
                .padding(.horizontal)
        }
    }
    
    private func footerButton(usingSystemName name: String, forLabel label: String) -> some View {
        Button {
            withAnimation { self.tab = label }
        } label: {
            VStack(spacing: 3) {
                Image(systemName: "\(name)\(self.tab == label ? ".fill" : "")")
                    .font(.system(size: 20, weight: .ultraLight))
                
                Text(label)
                    .font(.system(size: 8, weight: self.tab == label ? .regular : .light))
            }
            .foregroundColor(BG_PURPLE)
        }
        .padding(.horizontal, 15)
    }
    
    private var searchBarTextfield: some View {
        ZStack {
            Capsule()
                .fill(Color(white: 0.97))
            
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                
                TextField("Search for a food", text: $searchQuery)
                    .font(.system(size: 14))
                    .padding(10)
                    .foregroundColor(.black)
                
                if searchQuery != "" {
                    Button {
                        searchQuery = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
            
        }
    }
    
    private var searchBar: some View {
        ZStack {
            Color.white
            
            searchBarTextfield
                .padding(.horizontal)
                .padding(.bottom, 5)
                .padding(.top)
        }
    }
}


struct FooterButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
