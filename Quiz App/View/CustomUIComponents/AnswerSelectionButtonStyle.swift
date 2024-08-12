//
// 
// FileName: AnswerSelectionButtonStyle.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 4:05 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Answer selection option ButtonStyle for reusability
struct AnswerSelectionButtonStyle: ButtonStyle {
    
    let isAnswer: String
    var foregroundColor: Color {
        let color: Color = isAnswer == "w" ? .black : (isAnswer == "g" ? .black : .white)
        return color
    }
    var backgroundColor: Color {
        let color: Color = isAnswer == "w" ? .white : (isAnswer == "g" ? .rightAnsGreen : .wrongAnsRed)
        return color
    }
    var borderStroke: Color {
        let color: Color = isAnswer == "w" ? .gray.opacity(0.3) : (isAnswer == "g" ? .green.opacity(0.8) : .wrongAnsRed)
        return color
    }
    
    init(_ isAnswer: String) {
        self.isAnswer = isAnswer
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .padding(.leading)
            .foregroundColor(foregroundColor)
            .font(.system(size: 16, weight: .semibold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 44)
            .brightness(configuration.isPressed ? 0.09 : 0)
            .background(backgroundColor)
            .cornerRadius(22)
            .overlay (
                RoundedRectangle(cornerRadius: 22)
                    .stroke(borderStroke, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
