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
    let imageAsset: ImageAsset
    let alertMsg: AlertWarning
    let description: String
    
    var body: some View {
        VStack(spacing: 16) {
            Image(imageAsset.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 128, height: 73)
            
            Text(alertMsg)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
            
            if description.isNotEmpty {
                Text(description)
                    .foregroundColor(.black)
                    .font(.system(size: 14, weight: .regular))
            }
            
            HStack {
                Button("No") {
                    
                }
                .buttonStyle(CustomRoundedButtonStyle(12, .dimRed))
                
                Button("Yes") {
                    
                }
                .buttonStyle(CustomRoundedButtonStyle(12, .darkRed))
            }
        }
        .padding()
        .padding([.vertical])
        .frame(width: 300)
        .background(.white)
        .clipShape(CustomRoundedCorners(topLeft: 8, topRight: 8, bottomLeft: 8, bottomRight: 8))
    }
}

struct PopUpAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpAlertView(isAlert: .constant(false), imageAsset: ImageAsset.warningBack, alertMsg: "Title", description: "defsdfa")
    }
}
