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
    
    let cornerRadius: CGFloat
    
    init(_ cornerRadius: CGFloat = 0) {
        self.cornerRadius = cornerRadius
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .bold))
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .background(Color.darkRed)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
