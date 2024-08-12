//
// 
// FileName: QuizViewModel.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 3:49 PM
// Website: https://mdabirhossain.com/
//


import Foundation


class QuizViewModel: ObservableObject {
    
    @Published var quizData: QuizModel? = nil
    
    // Timer/Duration
    @Published var timer: Timer?
    @Published var endDate = "15-08-2024"
    @Published var remainingTime = "Enter an end date"
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
    
    func getQuizData() {
        let mainUrl = "https://herosapp.nyc3.digitaloceanspaces.com/quiz.json"
        guard let url = URL(string: mainUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                let response = try? JSONDecoder().decode(QuizModel.self, from: data)
                print("Response : \(response.debugDescription)")
                self.quizData = response
            }
        }
        .resume()
    }
    
    func startTimer() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
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
                    self.remainingSeconds = difference.second!
                    
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
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func nextButtonAction() {
        duration = 10
        isNextButtonDisabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isNextButtonDisabled = false
         }
    }
    
    func saveHighScore() {
        let defaults = UserDefaults.standard
        if defaults.integer(forKey: "HighScore") < totalCoin {
            defaults.set(totalCoin, forKey: "HighScore")
        }
    }
    
    func resetValues() {
        selectedIndex = 0
        duration = 10
        totalCoin = 0
        totalCorrectAns = 0
        isNextButtonDisabled = false
    }
}
