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
    
    @Binding var isAlert: Bool
    let alertType: AlertType
    let imageAsset: ImageAsset
    let alertMsg: AlertWarning
    let description: String
    
    let yesAction: () -> Void
    let backToHomeAction: () -> Void
    
    @State private var scaleEffect: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.05)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    removeAlert()
                }
            
            VStack(spacing: 16) {
                Image(imageAsset.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 128, height: 73)
                
                Text(alertMsg.rawValue)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                
                if description.isNotEmpty {
                    Text(description)
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                }
                
                if alertType == .otherAction {
                    HStack {
                        Button("No") {
                            removeAlert()
                            print("No button tapped from alert...")
                        }
                        .buttonStyle(CustomRoundedButtonStyle(12, .dimRed))
                        
                        Button("Yes") {
                            yesAction()
                            print("Yes button tapped from alert...")
                        }
                        .buttonStyle(CustomRoundedButtonStyle(12, .darkRed))
                    }
                } else {
                    Button("Back to home") {
                        backToHomeAction()
                        
                        print("'Back to home' button tapped from alert...")
                    }
                    .buttonStyle(CustomRoundedButtonStyle(12, .darkRed))
                }
            }
            .padding()
            .padding(.vertical, 6)
            .frame(width: 280)
            .background(.white)
            .clipShape(CustomRoundedCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8))
            .scaleEffect(scaleEffect)
            .onAppear(perform: {
                withAnimation {
                    scaleEffect = 1.2
                }
            })
            .onDisappear(perform: {
                withAnimation {
                    scaleEffect = 0.8
                }
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
