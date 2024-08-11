//
// 
// FileName: QuizBottomInfoView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10/8/24 at 10:21 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct QuizHomeBottomInfoView: View {
    
    @Binding var isAlert: Bool
    
    /// Timer
    @State private var timer: Timer?
    @State private var endDate = "15-08-2024"
    @State private var remainingTime = "Enter an end date"
    @State private var remainingDays = 0
    @State private var remainingHours = 0
    @State private var remainingMinutes = 0
    @State private var remainingSeconds = 0
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Today's Quiz on")
                .font(.system(size: 13))
            
            Text("General Knowledge")
                .foregroundColor(.darkRed)
                .font(.system(size: 20, weight: .heavy))
            
            Text("The Quiz ends in")
                .font(.system(size: 13))
            
            VStack(alignment: .center) {
                HStack {
                    if remainingDays > 0 {
                        TimerCellView(time: $remainingDays, timeType: "Days")
                    }
                    
                    if remainingHours > 0 {
                        TimerCellView(time: $remainingHours, timeType: "Hours")
                    }
                    
                    TimerCellView(time: $remainingMinutes, timeType: "Minutes")
                    
                    TimerCellView(time: $remainingSeconds, timeType: "Seconds")
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, -8)
            
            Button("PLAY QUIZ NOW") {
                withAnimation {
                    isAlert = true
                }
            }
            .buttonStyle(CustomRoundedButtonStyle(height: 56, cornerRadius: 28))
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .padding(.top)
        .foregroundColor(.black)
//        .frame(height: screenHeight / 2)
        .background(Color.white)
        .clipShape(CustomRoundedCorners(topLeft: 30, topRight: 30))
        .onAppear(perform: {
            startTimer()
        })
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
                    remainingDays = difference.day!
                    remainingHours = difference.hour!
                    remainingMinutes = difference.minute!
                    remainingSeconds = difference.second!
                    
                    remainingTime = "\(difference.day!) d  \(difference.hour!) h \(difference.minute!) m \(difference.second!) s"
                } else if difference.hour! > 0 {
                    remainingHours = difference.hour!
                    remainingMinutes = difference.minute!
                    remainingSeconds = difference.second!
                    
                    remainingTime = "\(difference.hour!) h  \(difference.minute!) m \(difference.second!) s"
                } else if difference.minute! > 0 {
                    remainingMinutes = difference.minute!
                    remainingSeconds = difference.second!
                    
                    remainingTime = "\(difference.minute!) m \(difference.second!) s"
                } else {
                    remainingSeconds = difference.second!
                    
                    remainingTime = "\(difference.second!) s"
                }
                
                if currentDate >= endDate {
                    stopTimer()
                }
            }
            
            self.timer = timer
        } else {
            remainingTime = "Invalid date format"
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct QuizBottomInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QuizHomeBottomInfoView(isAlert: .constant(false))
    }
}


struct TimerCellView: View {
    
    @Binding var time: Int
    let timeType: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(time)")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .heavy))
            
            Text(timeType)
                .foregroundColor(.gray)
                .font(.system(size: 13))
        }
        .padding(.horizontal, 3)
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(.gray.opacity(0.6), lineWidth: 1)
        )
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.timerBackground)
        )
    }
}
