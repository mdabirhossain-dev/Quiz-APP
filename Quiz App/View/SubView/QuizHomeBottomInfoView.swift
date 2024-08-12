//
// 
// FileName: QuizBottomInfoView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10/8/24 at 10:21 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Bottom portion of Home
struct QuizHomeBottomInfoView: View {
    
    @EnvironmentObject var quizViewModel: QuizViewModel
    @Binding var isAlert: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Today's Quiz on")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            
            Text("General Knowledge")
                .foregroundColor(.darkRed)
                .font(.system(size: 20, weight: .heavy))
            
            Text("The Quiz ends in")
                .foregroundColor(.gray)
                .font(.system(size: 13))
            
            /// Days/Hours/Minutes/Seconds cells
            HStack(alignment: .center) {
                if quizViewModel.remainingDays > 0 {
                    TimerCellView(time: $quizViewModel.remainingDays, timeType: "Days")
                }
                
                TimerCellView(time: $quizViewModel.remainingHours, timeType: "Hours")
                
                TimerCellView(time: $quizViewModel.remainingMinutes, timeType: "Minutes")
                
                TimerCellView(time: $quizViewModel.remainingSeconds, timeType: "Seconds")
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
        .onAppear(perform: {
            quizViewModel.startTimer()
        })
    }
}

struct QuizBottomInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QuizHomeBottomInfoView(isAlert: .constant(false))
    }
}


// MARK: - Reusable time cell for Home (Days/Hours/Minutes/Seconds)
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
        .frame(height: 57)
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
