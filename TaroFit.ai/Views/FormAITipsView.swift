//
//  FormAITipsView.swift
//  TaroFit.ai
//
//  Created by Rohan Kumar on 7/20/23.
//

import SwiftUI
import Combine

struct FormAITipsView: View {
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Header(title: "Get Form Tips", dateText: vm.dateText, showProfilePic: false)
                
                SearchBar("Search for Exercise", text: $vm.searchQuery)
                    .padding()
                
                ZStack(alignment: .bottom) {
                    
                    exercisesScrollView
                    
                    getInstructionsButton
                        .padding(.bottom)
                }
            }
            
            instructionsView()
                .offset(y: vm.showInstructionsSheet ? 0 : 1000)
            
            
        }
    }
    
    private var exercisesScrollView: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(1...10, id: \.self) { i in
                    card(for:
                            Exercise(
                                name: "Bench Press",
                                instructions: "",
                                muscleGroups: ["Chest", "Shoulders", "Triceps"],
                                id: i)
                    )
                }
                
                Spacer(minLength: 150)
            }
        }
    }
    
    private func updateResponseOnScreen() {
        if vm.textStatus == .inProgress {
            if vm.indexOfLastWordDisplayed < vm.wordsInAnswer.count - 1 {
                vm.indexOfLastWordDisplayed += 1
            } else {
                withAnimation { vm.textStatus = .completed }
            }
        }
    }
    
    private func card(for exercise: Exercise) -> some View {
        let isSelected = vm.selectedExerciseId == exercise.id
        
        return Button {
            if isSelected { withAnimation { vm.selectedExerciseId = nil } }
            else { withAnimation { vm.selectedExerciseId = exercise.id } }
            
            vm.indexOfLastWordDisplayed = 0
            
        } label: {
            HStack {
                
                
                VStack(alignment: .leading) {
                    Text(exercise.name)
                        .modifier(SubHeaderText())
                    
                    Text(exercise.muscleGroups.joined(separator: ", "))
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                
                ZStack {
                    Circle()
                        .stroke(isSelected ? BG_PURPLE : .black)
                        .opacity(isSelected ? 0 : 1)
                    
                    if isSelected {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 25, weight: .light))
                            .foregroundColor(BG_PURPLE.opacity(0.9))
                    }
                }
                .frame(width: 25)
            }
            .padding()
            .background(
                ZStack {
                    isSelected ? Color(white: 0.97) : .white
                    
                    Rectangle()
                        .stroke(Color(white: 0.95), lineWidth: 1)
                }
            )
        }
        
    }
    
    private var getInstructionsButton: some View {
        Button("Get Instructions") {
            withAnimation {
                vm.textStatus = .loading
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    vm.textStatus = .inProgress
                }

            }
        }
        .modifier(CapsuleButton())
        .offset(y: vm.selectedExerciseId == nil ? 200 : -70)
    }
    
    private func instructionsView() -> some View {
        ZStack {
            Color.white.ignoresSafeArea()
                
            VStack {
    
                ZStack {
                    HStack {
                        Button {
                            withAnimation { vm.textStatus = .notStarted }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .light))
                        }
                        
                        Spacer()
                        
                    }
                    
                    Text("Instructions")
                        .modifier(SubHeaderText())
                    
                }
                .padding()
                
                ZStack(alignment: .bottom) {
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack {
                            
                            Text(vm.displayedAnswer)
                                .font(.system(size: 13, weight: .light, design: .monospaced))
                                .foregroundColor(.black)
                        }
                        .frame(width: 0.9 * UIScreen.main.bounds.width, alignment: vm.textStatus == .loading ? .center : .leading)
                    }

                    
                    Button("I Understand!") {
                        withAnimation { vm.textStatus = .notStarted }
                    }
                    .modifier(CapsuleButton())
                    .offset(y: vm.textStatus == .completed ? -70 : 200)
                        
                }
                
                Spacer()
                
            }
            .onReceive(vm.timer) { _ in
                self.updateResponseOnScreen()
            }
        }
        
    }
    
    
    
}

struct FormAITipsView_Previews: PreviewProvider {
    static var previews: some View {
        FormAITipsView()
    }
}

extension FormAITipsView {
    
    private final class Exercise: Identifiable, Hashable {
        var id: Int
        var name: String
        var instructions: String
        var muscleGroups: [String]
        
        init(name: String, instructions: String, muscleGroups: [String], id: Int) {
            self.name = name
            self.instructions = instructions
            self.muscleGroups = muscleGroups
            self.id = id
        }
        
        static func == (lhs: Exercise, rhs: Exercise) -> Bool {
            return lhs.id == rhs.id
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
        
    }
    
    enum Status {
        case notStarted
        case loading
        case inProgress
        case completed
    }
    
    @MainActor final class ViewModel: ObservableObject {
        @Published private(set) var dateText: String = "Sunday, July 18"
        @Published var searchQuery: String = ""
        @Published var selectedExerciseId: Int? = nil
        
        @Published var indexOfLastWordDisplayed: Int = 0
        @Published var textStatus: Status = .notStarted
        
        
        let timer = Timer.publish(every: 0.1, on: .current, in: .common).autoconnect()
        
        let answer: String = "To perform Ab Wheel Rollouts effectively, follow these tips:\n\n1. Start in a kneeling position with your knees hip-width apart and your hands gripping the handles of the ab wheel.\n2. Engage your core by pulling your belly button towards your spine and squeezing your glutes.\n3. Slowly roll the ab wheel forward, keeping your arms straight and your back flat. Aim to roll out as far as you can while maintaining control and without letting your lower back sag.\n4. Pause for a moment at the end of the movement, feeling the stretch in your abs.\n5. Engage your core and use your abs to pull the ab wheel back towards your knees, maintaining control throughout the movement.\n6. Aim to perform 8-12 reps of Ab Wheel Rollouts, focusing on quality of movement rather than quantity.\n7. If you find the exercise too challenging, you can modify it by starting with a smaller range of motion or by performing the movement against a wall for added stability."
        
        var wordsInAnswer: [String] {
            return answer.components(separatedBy: " ")
        }
        
        var displayedAnswer: String {
            if self.textStatus == .loading || self.textStatus == .notStarted {
                return "..."
            }
            return wordsInAnswer[...indexOfLastWordDisplayed].joined(separator: " ")
        }
        
        var showInstructionsSheet: Bool {
            return textStatus != .notStarted
        }
    }
}
