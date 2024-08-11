//
// 
// FileName: QuizView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 10:41 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct QuizView: View {
    
    @State private var isAlert = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack(alignment: .center) {
            GradientView()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                HStack {
                    Text("Question 2/20")
                        .foregroundColor(Color.darkRed)
                        .font(.system(size: 14, weight: .regular))
                    
                    Spacer()
                    
                    Text("50").foregroundColor(Color.darkRed)
                        .font(.system(size: 19, weight: .bold))
                    
                    Image("coins")
                        .resizable()
                        .frame(width: 30, height: 25)
                }
                
                Image("thumb_image")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: screenWidth / 2.2)
                    .padding(.horizontal, 30)
                
                Text("What is the name of this card in the JRF?")
                    .foregroundColor(Color.black)
                    .font(.system(size: 20, weight: .bold))
                
                GeometryReader { geo in
                    TimerDurationView()
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: screenWidth - 20, maxHeight: .infinity)
            .background(Color.white)
            .clipShape(CustomRoundedCorners(topLeft: 20, topRight: 20, bottomLeft: 20, bottomRight: 20))
            
            if isAlert {
                PopUpAlertView(isAlert: $isAlert, alertType: AlertType.otherAction, imageAsset: .warningBack, alertMsg: .warningBack, description: "", yesAction: {
                    presentation.wrappedValue.dismiss()
                }, backToHomeAction: {
                    presentation.wrappedValue.dismiss()
                })
            }
        }
        .customNavBar(isAlert: $isAlert, isHome: false, isTrailing: false)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
