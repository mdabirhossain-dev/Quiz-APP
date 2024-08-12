//
// 
// FileName: HomeView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 3:47 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct HomeView: View {
    
    @StateObject var quizViewModel = QuizViewModel()
    @State private var isAlert = false
    @State private var isNavigateToQuiz = false
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack(alignment: .center) {
            GradientView()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .bottom) {
                    Image("sun")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 141, height: 141)
                        .overlay {
                            VStack {
                                Text("500")
                                    .foregroundColor(.darkRed)
                                    .font(.system(size: 32, weight: .bold))
                                
                                Text("High Score")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13))
                            }
                        }
                    
                    Spacer()
                    
                    Image("large_coins")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 186, height: 169)
                        .padding(.trailing, -16)
                        .padding(.bottom, 16)
                }
                .frame(height: screenHeight / 4.5)
                .padding([.horizontal, .top])
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("JRF Sundays's")
                        .font(.system(size: 32, weight: .heavy))
                    
                    Text("Supper Quiz")
                        .font(.system(size: 48, weight: .heavy))
                    
                    Text("Play Super Quiz & earn **500** coin")
                        .font(.system(size: 13))
                }
                .padding(.horizontal)
                
                QuizHomeBottomInfoView(isAlert: $isAlert)
                    .background(
                        Color.white
                            .ignoresSafeArea(.all, edges: .bottom)
                            .clipShape(CustomRoundedCorners(topLeft: 30, topRight: 30))
                    )
                    .environmentObject(quizViewModel)
            }
            .foregroundColor(.white)
            
            if isAlert {
                PopUpAlertView(isAlert: $isAlert, alertType: AlertType.otherAction, imageAsset: .warningShield, alertMsg: .warningShield, description: "", yesAction: {
                    isNavigateToQuiz = true
                    isAlert = false
                }, backToHomeAction: {
                    
                })
            }
        }
        .customNavBar(isAlert: $isAlert, isHome: true, isTrailing: true)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $isNavigateToQuiz) {
            QuizView()
                .environmentObject(quizViewModel)
        }
        .onAppear(perform: {
            UIScrollView.appearance().bounces = false
            quizViewModel.getQuizData()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
