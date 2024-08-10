//
// 
// FileName: CustomNavBarModifier.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10/8/24 at 8:10 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI


struct CustomNavBarModifier: ViewModifier {
    
    let isHome: Bool
    let isTrailing: Bool
    @Environment(\.presentationMode) var presentation
    
    func body(content: Content) -> some View {
        return content
            .toolbar {
                
//                ToolbarItemGroup(placement: .navigationBarLeading) {
//
//                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if isTrailing {
                        ZStack {
                            Image("bell")
                                .resizable()
                                .frame(width: 18, height: 20)
                            
                            ZStack(alignment: .center) {
                                Circle()
                                    .fill(.black)
                                    .frame(width: 14, height: 14)
                                
                                Text("3")
                                    .foregroundColor(.white)
                                    .font(.system(size: 8))
                            }
                            .padding(.bottom, 20)
                            .padding(.leading, 14)
                        }
                    }
                }
                
            }
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func customNavBar(isHome: Bool, isTrailing: Bool) -> some View {
        return self.modifier(CustomNavBarModifier(isHome: isHome, isTrailing: isTrailing))
    }
}
