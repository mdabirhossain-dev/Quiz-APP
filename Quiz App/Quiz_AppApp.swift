//
// 
// FileName: Quiz_AppApp.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 2:52 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

@main
struct Quiz_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
