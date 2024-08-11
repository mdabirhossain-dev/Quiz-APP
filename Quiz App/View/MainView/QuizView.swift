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
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack(alignment: .center) {
            GradientView()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
            }
            .frame(maxWidth: screenWidth - 16, maxHeight: .infinity)
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
