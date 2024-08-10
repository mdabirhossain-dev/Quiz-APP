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
    
    var body: some View {
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        ZStack(alignment: .topLeading) {
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
                    
                    Image("coins")
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
                
                QuizBottomInfoView()
            }
            .foregroundColor(.white)
        }
        .customNavBar(isHome: true, isTrailing: true)
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
