//
// 
// FileName: QuizViewModel.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 3:49 PM
// Website: https://mdabirhossain.com/
//


import Foundation


class QuizViewModel: ObservableObject {
    
    @Published var quizData: QuizModel? = nil
    
    func getQuizData() {
        let mainUrl = "https://herosapp.nyc3.digitaloceanspaces.com/quiz.json"
        guard let url = URL(string: mainUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                let response = try? JSONDecoder().decode(QuizModel.self, from: data)
                print("Response : \(response.debugDescription)")
                self.quizData = response
            }
        }
        .resume()
    }
}
