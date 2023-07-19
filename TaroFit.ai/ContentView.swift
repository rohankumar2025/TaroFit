//
//  ContentView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tab: String = "Dashboard"
    
    var body: some View {
        
        ZStack {
            TabView(selection: $tab) {
                HomeView()
                    .tag("Dashboard")
                ToolsView()
                    .tag("Tools")
            }
            
            VStack {
                Spacer()
                
                FooterView(tab: $tab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
