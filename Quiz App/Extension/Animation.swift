//
// 
// FileName: Animation.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 7:41 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Customised slide animation for Question
extension AnyTransition {
    static var customSlideAnimation: AnyTransition {
//        AnyTransition.scale.combined(with: .slide)
        AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
  }
}
