//
//  ToolsView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/19/23.
//

import SwiftUI

struct ToolsView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List(vm.tools, id: \.self) { tool in
                        NavigationLink {
                            Text(tool)
                        } label: {
                            Text(tool)
                        }
                    }
                    .navigationTitle("AI Tools")
                }
                
                Spacer()
            }
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}

extension ToolsView {
    @MainActor final class ViewModel: ObservableObject {
        let tools = ["Learn Proper Technique", "Get Macros For Any Food", "Estimate Your Body Fat %"]
    }
}
