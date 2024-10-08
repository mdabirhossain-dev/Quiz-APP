//
// 
// FileName: HomeView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 3:47 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Home View
struct HomeView: View {
    
    @StateObject var quizViewModel = QuizViewModel()
    @State private var isAlert = false
    @State private var isNavigateToQuiz = false
    
    // MARK: - Saved score
    @AppStorage("HighScore") var highScore: Int = 0
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        
        ZStack(alignment: .center) {
            GradientView()
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(alignment: .bottom) {
                    // MARK: - High Score
                    Image("sun")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 141, height: 141)
                        .overlay {
                            VStack {
                                Text("\(highScore)")
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
//                .frame(height: screenHeight / 4.5)
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
                
                // MARK: - Bottom portion
                QuizHomeBottomInfoView(isAlert: $isAlert)
//                    .frame(height: screenHeight / 3)
                    .ignoresSafeArea(.all, edges: .bottom)
                    .background(
                        Color.white
                            .clipShape(CustomRoundedCorners(topLeft: 30, topRight: 30))
                            .ignoresSafeArea(.all, edges: .bottom)
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
            
            if quizViewModel.isDataLoading {
                LoadingAnimationView()
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
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
            
            if quizViewModel.quizData == nil {
                quizViewModel.getQuizData()
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
