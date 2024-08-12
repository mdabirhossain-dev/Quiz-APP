//
// 
// FileName: LoadingAnimationView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 13-08-2024 at 4:07 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI
import Lottie

struct LoadingAnimationView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.6)
                .ignoresSafeArea(.all)
            
            LottieView(animation: .named("loading_animation"))
              .looping()
              .scaleEffect(2)
        }
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}
