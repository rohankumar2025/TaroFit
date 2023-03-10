//
//  HomeScreenView.swift
//  TaroFit
//
//  Created by Rohan Kumar on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var profile: ProfileManager
    
    
    var body: some View {
        let darkColor = colorScheme == .light ? Color.black : .white
        let lightColor = colorScheme == .light ? Color.white : .black
        
        ZStack {
            ScrollView {
                HeaderStruct(profile.currDate, showProfilePic: true)
                
                ZStack {
                    // Rounded rectangle background
                    RoundedRectangle(cornerRadius: 30)
                        .fill(lightColor)
                        .shadow(color: footerPurple.opacity(0.2), radius: 30, x: 10, y: 30)
                    
                    VStack {
                        // Calorie chart
                        let caloriesEaten = profile.userData[profile.currDate]?["CaloriesEaten"] as? Int ?? 0
                        let maintenanceCalories = profile.userData[profile.currDate]?["MaintenanceCalories"] as? Int ?? -1
                        CalorieChart(caloriesEaten, maintenanceCalories: maintenanceCalories)
                        
                        Text("Today's Goals")
                            .font(.system(size: screenWidth * 0.05, weight: .semibold))
                            .padding(.bottom)
                        
                        // To do buttons
                        HStack {

                            let didTrackMeal = profile.userData[profile.currDate]?["CaloriesEaten"] as? Int ?? 0 != 0
                            let didEnterWeight = profile.userData[profile.currDate]?["Weight"] as? Int ?? 0 != 0
                            let didAbWorkout = profile.userData[profile.currDate]?["AbWorkout"] as? Bool ?? false
                            HomeButtonStruct("salad", buttonText: "Track a Meal", isCompleted: didTrackMeal) {
                                //navInfo.showMealEntrySheet = true
                            }
                            
                            HomeButtonStruct("weightscale", buttonText: "Enter Weight", isCompleted: didEnterWeight) {
                                //navInfo.showWeightEntrySheet = true
                            }
                            
                            HomeButtonStruct("core", buttonText: "Train your Core", isCompleted: didAbWorkout) {
                                profile.currentTab = 3 // Opens core tab
                            }
                        }
                        .padding(.top)
                        
                        
                        Spacer()
                
                    }
                    
                    
                    
                    
                    
                    
                    
                }
                .frame(width: screenWidth * 0.95, height: screenHeight * 0.77)
                .padding(.top)
                
                Spacer()
            }
        }
    }
    
    struct CalorieChart: View {
        @Environment(\.colorScheme) var colorScheme
        private var caloriesEaten: Int
        private var maintenanceCalories: Int
        
        init(_ caloriesEaten: Int, maintenanceCalories: Int) {
            self.caloriesEaten = caloriesEaten
            self.maintenanceCalories = maintenanceCalories
        }
        
        var body: some View {
            let darkColor = colorScheme == .light ? Color.black : .white
            
            ZStack {
                
                let progress = Double(caloriesEaten / maintenanceCalories)
                
                Circle()
                    .trim(from: 0.0, to: 0.6)
                    .stroke(.gray.opacity(colorScheme == .light ? 0.1 : 0.25), style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: -198))
                
                Circle()
                    .trim(from: 0.0, to: min(progress * 0.6, 0.6))
                    .stroke(progress > 1 ? .red.opacity(0.4) : .green.opacity(0.6), style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: -198))
                    .animation(.easeInOut(duration: 1), value: progress)
                
                VStack {
                    Text(verbatim: "\(maintenanceCalories - (caloriesEaten))")
                        .font(.system(size: screenWidth * 0.14, weight: .semibold, design: .rounded))
                    
                    Text("calories left")
                        .font(.system(size: screenWidth * 0.03, weight: .light))
                }
                .foregroundColor(darkColor)
                
            }
            .frame(height: screenWidth * 0.7)
            .padding(.top, screenHeight * 0.05)
        }
        
    }
    
    
    
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppHomeView()
            .environmentObject(ProfileManager())
    }
}
