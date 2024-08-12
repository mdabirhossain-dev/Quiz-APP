//
// 
// FileName: CustomNavBarModifier.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10/8/24 at 8:10 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Reusabile custom Nav Bar
struct CustomNavBarModifier: ViewModifier {
    
    @Binding var isAlert: Bool
    let isHome: Bool
    let isTrailing: Bool
    @Environment(\.presentationMode) var presentation
    
    func body(content: Content) -> some View {
        return content
            .toolbar {
                ///  Left contents
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if isHome {
                        Button {
                            print("Button tapped topLeft from home...")
                        } label: {
                            Image("four_circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    } else {
                        Button {
                            isAlert = true
                            print("Back button tapped from QuizView...")
                        } label: {
                            Image("arrow_left")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                
                /// Right contents
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if isTrailing {
                        Button {
                            print("Notification bar button tapped...")
                        } label: {
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
            }
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func customNavBar(isAlert: Binding<Bool>, isHome: Bool, isTrailing: Bool) -> some View {
        return self.modifier(CustomNavBarModifier(isAlert: isAlert, isHome: isHome, isTrailing: isTrailing))
    }
}
