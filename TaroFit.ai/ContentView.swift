//
//  ContentView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var tab: Tab
    
    init(tab: Tab = .dashboard) {
        self.tab = tab
    }
    
    var body: some View {
        
        ZStack {
            TabView(selection: $tab) {
                HomeView()
                    .tag(Tab.dashboard)
                NutritionView()
                    .tag(Tab.nutrition)
                ToolsView()
                    .tag(Tab.tools)
            }
            
            VStack {
                Spacer()
                
                FooterView(selectedTab: $tab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
