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
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var quizViewModel: QuizViewModel
    @State private var selectedIndex = 0
    @State private var duration = 10
    
    @State private var isAlert = false
    
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
                
                if let url = quizViewModel.quizData?.questions?[selectedIndex].questionImageURL {
                    AsyncImage(url: URL(string: url)) { image in
                        image
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: screenWidth / 2.2)
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                        
                    } placeholder: {
                        Image("no_image")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: screenWidth / 2.2)
                            .overlay (
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.darkRed, lineWidth: 1)
                            )
                            .padding(.horizontal, 30)
                    }
                } else {
                    Image("no_image")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: screenWidth / 2.2)
                        .overlay (
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.darkRed, lineWidth: 1)
                        )
                        .padding(.horizontal, 30)
                }
                
                Text("What is the name of this card in the JRF?")
                    .foregroundColor(Color.black)
                    .font(.system(size: 20, weight: .bold))
                
                TimerDurationView(duration: $duration)
                    .frame(height: 30)
                
                ForEach(0..<(quizViewModel.quizData?.questions?.count ?? 0), id: \.self) { index in
                    if selectedIndex == index {
                        AnswerSelectionCellView(index: index)
                            .padding(.trailing)
                            .transition(AnyTransition.customSlideAnimation)
                            .environmentObject(quizViewModel)
                    }
                }
                
                Button("NEXT") {
                    if selectedIndex < quizViewModel.quizData?.questions?.count ?? 0 {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            selectedIndex += 1
                        }
                    } else {
                        isAlert = true
                    }
                    duration = 10
                }
                .buttonStyle(CustomRoundedButtonStyle(height: 56, cornerRadius: 28))
                .padding(.vertical, 10)
            }
            .padding(.all)
            .frame(maxWidth: screenWidth - 20, maxHeight: .infinity, alignment: .top)
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
        .navigationTitle("🕣 2:36")
        .preferredColorScheme(.dark)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
