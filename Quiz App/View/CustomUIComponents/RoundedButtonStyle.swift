//
// 
// FileName: RoundedButtonStyle.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10/8/24 at 11:54 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct CustomRoundedButtonStyle: ButtonStyle {
    
    let height: CGFloat
    let cornerRadius: CGFloat
    let backgroundColor: Color
    
    init(height: CGFloat = 56, cornerRadius: CGFloat = 0, backgroundColor: Color = .darkRed) {
        self.height = height
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .foregroundColor(backgroundColor == .darkRed ? .white : .darkRed)
            .font(.system(size: 16, weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
