//
//  HomeView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/18/23.
//

import SwiftUI

let BG_PURPLE = Color.init(red: 160/255, green: 138/255, blue: 255/255)

struct HomeView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        
        VStack(spacing: 0) {
            header
                .padding(.bottom)
            
            ZStack {
                BG_PURPLE.opacity(0.2).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    nutrition
                    
                    analytics
                }
            }
        }
        
        
    }
    
    private var header: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(vm.dateText)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .foregroundColor(.gray)
                
                Text("Dashboard")
                    .modifier(HeaderText())
            }
            
            Spacer()
            
            ProfilePicView(withRadius: 40)
        }
        .padding(.horizontal)
    }
    
    private var nutrition: some View {
        
        VStack {
            
            VStack {
                
                HStack {
                    Text("Nutrition & Target Macros")
                        .modifier(SubHeaderText())
                    
                    Spacer()
                }
                
                nutritionBars()
                
                nutritionChartButtons
            }
            .padding()
            .background(Rectangle().fill(.white))
            
            nutritionChartCircleIndicators
            
        }
        
        
    }
    
    private func nutritionBars() -> some View {
        VStack {
            ForEach(1...4, id: \.self) { i in
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(white: 0.95))
                        .frame(width: UIScreen.main.bounds.width * 0.95, height: 40)
                }
            }
            
        }
    }
    
    private var nutritionChartButtons: some View {
        HStack(spacing: 0) {
            Text("Consumed")
                .foregroundColor(vm.nutritionChartState == .consumed ? .white : .black)
                .padding(8)
                .onTapGesture { withAnimation { vm.nutritionChartState = .consumed } }
            
            Text("Remaining")
                .foregroundColor(vm.nutritionChartState == .remaining ? .white : .black)
                .padding(8)
                .onTapGesture { withAnimation { vm.nutritionChartState = .remaining } }
            
        }
        .background(
            ZStack {
                Capsule().fill(Color(white: 0.95))
                HStack(spacing: 0) {
                    if vm.nutritionChartState == .remaining { Spacer() }
                    Capsule().fill(.black)
                        .frame(width: 70)
                    if vm.nutritionChartState == .consumed { Spacer() }
                }
                
            }
        )
        .font(.system(size: 11, weight: .light))
    }
    
    private var nutritionChartCircleIndicators: some View {
        HStack {
            Circle()
                .fill(vm.nutritionChartState == .consumed ? .black : BG_PURPLE.opacity(0.5))
                .frame(width: 5, height: 5)
            
            Circle()
                .fill(vm.nutritionChartState == .remaining ? .black : BG_PURPLE.opacity(0.5))
                .frame(width: 5, height: 5)
        }
    }
    
    private var analytics: some View {
        VStack(alignment: .leading) {
            Text("Analytics & Trends")
                .modifier(SubHeaderText())
            
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                analyticCard(forMetric: "Consumption", startingAt: "July 11", withAverage: "2150", label: "cal")
                analyticCard(forMetric: "Weight", startingAt: "July 11", withAverage: "198", label: "lbs")
                analyticCard(forMetric: "Steps", startingAt: "July 11", withAverage: "10,400", label: "steps")
                analyticCard(forMetric: "Protein Intake", startingAt: "July 11", withAverage: "245", label: "g")

            }
            
            Spacer(minLength: 150)
        }
        .padding(.horizontal)
    }
    
    private func analyticCard(forMetric metric: String, startingAt startDate: String, withAverage average: String, label: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            
            VStack(alignment: .leading) {
                Text(metric)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                
                Text("\(startDate) - Now")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Rectangle()
                    .fill(Color(white: 0.95))
                    .frame(height: 1)
                
                HStack(alignment: .bottom, spacing: 2) {
                    Text(average)
                        .font(.system(size: 15, weight: .medium))
                    
                    Text(label)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.black)
                }
                
                
            }
            .padding()
            
            
        }
        .frame(height: 150)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension HomeView {
    
    enum NutritionChartState: String, CaseIterable {
        case consumed = "Consumed"
        case remaining = "Remaining"
        
        func getName() -> String {
            return self.rawValue
        }
    }
    
    @MainActor final class ViewModel: ObservableObject {
        @Published private(set) var dateText: String = "Sunday, July 18"
        @Published var nutritionChartState: NutritionChartState = .consumed
    }
}
