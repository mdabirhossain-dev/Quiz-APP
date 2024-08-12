//
// 
// FileName: PopUpAlertView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 12:53 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct PopUpAlertView: View {
    
    @EnvironmentObject var quizViewModel: QuizViewModel
    @Binding var isAlert: Bool
    let alertType: AlertType
    let imageAsset: ImageAsset
    let alertMsg: AlertWarning
    let description: String
    
    let yesAction: () -> Void
    let backToHomeAction: () -> Void
    
    @State private var scaleEffect: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    if alertType != .quizFinished {
                        removeAlert()
                    }
                }
            
            VStack(spacing: 16) {
                Image(imageAsset.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 128, height: 73)
                
                Text(alertMsg.rawValue)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                
                if alertType == .quizFinished {
                    HStack {
                        Text(description) +
                        
                        Text("**\(quizViewModel.totalCoin)**")
                            .foregroundColor(.darkRed) +
                        
                        Text(" coin")
                    }
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.center)
                }
                
                if alertType == .otherAction {
                    HStack {
                        Button("No") {
                            removeAlert()
                            print("No button tapped from alert...")
                        }
                        .buttonStyle(CustomRoundedButtonStyle(height: 48, cornerRadius: 12, backgroundColor: .dimRed))
                        
                        Button("Yes") {
                            yesAction()
                            print("Yes button tapped from alert...")
                        }
                        .buttonStyle(CustomRoundedButtonStyle(height: 48, cornerRadius: 12, backgroundColor: .darkRed))
                    }
                } else {
                    Button("Back to home") {
                        backToHomeAction()
                        
                        print("'Back to home' button tapped from alert...")
                    }
                    .buttonStyle(CustomRoundedButtonStyle(height: 48, cornerRadius: 12, backgroundColor: .darkRed))
                }
            }
            .padding()
            .padding(.vertical, 6)
            .frame(width: 300)
            .background(.white)
            .clipShape(CustomRoundedCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8))
            .scaleEffect(scaleEffect)
            .onAppear(perform: {
                withAnimation {
                    scaleEffect = 1
                }
            })
            .onDisappear(perform: {
                removeAlert()
            })
        }
    }
    
    func removeAlert() {
        withAnimation {
            scaleEffect = 0.8
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isAlert = false
            }
        }
    }
}

struct PopUpAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpAlertView(isAlert: .constant(false), alertType: AlertType.otherAction, imageAsset: ImageAsset.warningBack, alertMsg: AlertWarning.warningBack, description: "defsdfa", yesAction: {
            
        }, backToHomeAction: {
            
        })
    }
}
