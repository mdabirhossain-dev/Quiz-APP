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
        
        ZStack(alignment: .top) {
            GradientView().edgesIgnoringSafeArea(.all)
            
            VStack() {
                HStack {
                    Image("sun")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("coins")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .frame(height: screenHeight / 3)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
