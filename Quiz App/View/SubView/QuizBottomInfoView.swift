//
// 
// FileName: QuizBottomInfoView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10/8/24 at 10:21 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct QuizBottomInfoView: View {
    
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
                    TimerCellView(time: .constant(2), timeType: .constant("Hours"))
                    
                    Spacer()
                    
                    TimerCellView(time: .constant(30), timeType: .constant("Minutes"))
                    
                    Spacer()
                    
                    TimerCellView(time: .constant(50), timeType: .constant("Seconds"))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.top, -8)
            
            Button("PLAY QUIZ NOW") {
                
            }
            .buttonStyle(CustomRoundedButtonStyle(28))
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .padding(.top)
        .foregroundColor(.black)
        .frame(height: screenHeight / 2)
        .background(.white)
        .clipShape(CustomRoundedCorners(topLeft: 30, topRight: 30))
    }
}

struct QuizBottomInfoView_Previews: PreviewProvider {
    static var previews: some View {
        QuizBottomInfoView()
    }
}


struct TimerCellView: View {
    
    @Binding var time: Int
    @Binding var timeType: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(time)")
                .foregroundColor(.black)
                .font(.system(size: 20, weight: .heavy))
            
            Text(timeType)
                .foregroundColor(.gray)
                .font(.system(size: 13))
        }
        .frame(width: 90, height: 50)
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
