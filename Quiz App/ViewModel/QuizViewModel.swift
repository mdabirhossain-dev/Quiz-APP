//
// 
// FileName: QuizViewModel.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 3:49 PM
// Website: https://mdabirhossain.com/
//


import Foundation

// MARK: - View Model
class QuizViewModel: ObservableObject {
    
    @Published var quizData: QuizModel? = nil
    @Published var isDataLoading = false
    
    // Timer/Duration
    @Published var timer: Timer?
    @Published var endDate = "15-08-2024 23:59" // "15-08-2024"
    @Published var remainingTime = "Time Up"
    @Published var remainingDays = 0
    @Published var remainingHours = 0
    @Published var remainingMinutes = 0
    @Published var remainingSeconds = 0
    
    // Quiz
    @Published var selectedIndex = 0
    @Published var duration = 10
    
    @Published var totalCoin = 0
    @Published var totalCorrectAns = 0
    
    @Published var isNextButtonDisabled = false
    
    /// Fetching questions from API
    func getQuizData() {
        /// Start loading animation
        isDataLoading = true
        
        let mainUrl = "https://herosapp.nyc3.digitaloceanspaces.com/quiz.json"
        guard let url = URL(string: mainUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                let response = try? JSONDecoder().decode(QuizModel.self, from: data)
                print("Response : \(response.debugDescription)")
                self.quizData = response
                
                /// Finish loading animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.isDataLoading = false
                }
            }
        }
        .resume()
    }
    
    /// Timer for Quiz end time
    func startTimer() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm" // "dd-MM-yyyy"
        
        if let endDate = formatter.date(from: self.endDate) {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                let currentDate = Date()
                
                let calendar = Calendar.current
                let difference = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: endDate)
                
                if difference.day! > 0 {
                    self.remainingDays = difference.day!
                    self.remainingHours = difference.hour!
                    self.remainingMinutes = difference.minute!
                    self.remainingSeconds = difference.second!
                    
                    self.remainingTime = "\(difference.day!)d : \(difference.hour!)h : \(difference.minute!)m" // \(difference.second!) s"
                } else if difference.hour! > 0 {
                    self.remainingHours = difference.hour!
                    self.remainingMinutes = difference.minute!
                    self.remainingSeconds = difference.second!
                    
                    self.remainingTime = "\(difference.hour!)h : \(difference.minute!)m" // \(difference.second!) s"
                } else if difference.minute! > 0 {
                    self.remainingMinutes = difference.minute!
                    self.remainingSeconds = difference.second!
                    
                    self.remainingTime = "\(difference.minute!) m" // \(difference.second!) s"
                } else {
                    self.remainingSeconds = difference.second! <= 0 ? 0 : difference.second!
                    
//                    self.remainingTime = "\(difference.second!) s"
                }
                
                if currentDate >= endDate {
                    self.stopTimer()
                }
            }
            
            self.timer = timer
        } else {
            self.remainingTime = "Invalid date format"
        }
    }
    
    /// Quiz timer will stop when coundown will be finished or reached desired date
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    /// Quiz next button action to reset the countdown and to make NEXT button disabile for 2 seconds
    func nextButtonAction() {
        duration = 10
        isNextButtonDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isNextButtonDisabled = false
        }
    }
    
    /// Saving HighScore only if new score is greater than previously saved value
    func saveHighScore() {
        let defaults = UserDefaults.standard
        
        if defaults.integer(forKey: "HighScore") < totalCoin {
            defaults.set(totalCoin, forKey: "HighScore")
        }
    }
    
    /// Previous all the progress will reset when starting the Quiz from the begining
    func resetValues() {
        selectedIndex = 0
        duration = 10
        totalCoin = 0
        totalCorrectAns = 0
        isNextButtonDisabled = false
    }
}
