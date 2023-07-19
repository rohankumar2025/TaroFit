//
//  FooterView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct FooterView: View {
    @Binding var selectedTab: Tab
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
                    footerButton(usingSystemName: "rectangle.grid.2x2", forTab: .dashboard)
                    footerButton(usingSystemName: "carrot", forTab: .nutrition)
                    
                    plusButton
                    
                    footerButton(usingSystemName: "list.clipboard", forTab: .plan)
                    footerButton(usingSystemName: "wrench.adjustable", forTab: .tools)
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
    
    private func footerButton(usingSystemName name: String, forTab tab: Tab) -> some View {
        Button {
            withAnimation { self.selectedTab = tab }
        } label: {
            VStack(spacing: 3) {
                Image(systemName: "\(name)\(self.selectedTab == tab ? ".fill" : "")")
                    .font(.system(size: 20, weight: .ultraLight))
                
                Text(tab.name)
                    .font(.system(size: 8, weight: self.selectedTab == tab ? .regular : .light))
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
