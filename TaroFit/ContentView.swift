//
//  ContentView.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var profile = ProfileManager()
    
    
    
    var body: some View {
        AppHomeView()
            .environmentObject(profile)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
