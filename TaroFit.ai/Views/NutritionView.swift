//
//  NutritionView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/19/23.
//

import SwiftUI
import Charts

struct NutritionView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: "Nutrition", dateText: vm.dateText)
                .padding(.bottom)
            
            ZStack(alignment: .top) {
                BG_PURPLE.opacity(0.2).ignoresSafeArea()
                
                ScrollView {
                    
                    VStack {
                        // MARK: ADD CHART HEADER
                        
                        chart
                    }
                    .padding()
                    .background(.white)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    
                }
                
                
            }
        }
    }
    
    private var chart: some View {
        Chart {
            ForEach(vm.chartData) { datapoint in
                LineMark(x: .value("Date", datapoint.date), y: .value("Weight", datapoint.value))
                    .symbol(.circle)
            }
            .interpolationMethod(.cardinal)
            .foregroundStyle(BG_PURPLE)
        }
    }
    

}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tab: .nutrition)
    }
}

extension NutritionView {
    
    enum ChartType: String, CaseIterable {
        case weight = "Weight"
        case calorie = "Calorie"
        case protein = "Protein"
        
        var name: String { self.rawValue }
    }
    
    class ChartData: Identifiable {
        let id = UUID()
        var date: Date
        var value: Double
        
        init(value: Double, date: Date) {
            self.date = date
            self.value = value
        }
    }
    
    
    @MainActor final class ViewModel: ObservableObject {
        @Published private(set) var dateText: String = "Sunday, July 18"
        @Published var currentChart: ChartType = .weight
        
        @Published private(set) var weightData: [ChartData] = [
            ChartData(value: 400, date: Date(timeInterval: 400, since: Date())),
            ChartData(value: 500, date: Date(timeInterval: 600, since: Date())),
            ChartData(value: 400, date: Date(timeInterval: 800, since: Date())),
            ChartData(value: 450, date: Date(timeInterval: 1100, since: Date())),
        ]
        @Published private(set) var calorieData: [ChartData] = [
            ChartData(value: 400, date: Date(timeInterval: 400, since: Date())),
            ChartData(value: 500, date: Date(timeInterval: 600, since: Date())),
            ChartData(value: 400, date: Date(timeInterval: 800, since: Date())),
            ChartData(value: 450, date: Date(timeInterval: 1100, since: Date())),
        ]
        
        @Published private(set) var proteinData: [ChartData] = [
            ChartData(value: 400, date: Date(timeInterval: 400, since: Date())),
            ChartData(value: 500, date: Date(timeInterval: 600, since: Date())),
            ChartData(value: 400, date: Date(timeInterval: 800, since: Date())),
            ChartData(value: 450, date: Date(timeInterval: 1100, since: Date())),
        ]
        
        var chartData: [ChartData] {
            switch self.currentChart {
            case .calorie:
                return self.calorieData
            case .weight:
                return self.weightData
            case .protein:
                return self.proteinData
            }
        }
        
        var chartUnits: String {
            switch self.currentChart {
            case .calorie:
                return "Cals"
            case .weight:
                return "lbs"
            case .protein:
                return "g"
            }
        }
        
        var chartAverage: Double {
            var sum: Double = 0
            for datapoint in self.chartData {
                sum += datapoint.value
            }
            let average = sum / Double(self.chartData.count)
            return average
        }
    }
}
