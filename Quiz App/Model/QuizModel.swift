//
// 
// FileName: QuizModel.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 10-08-2024 at 3:48 PM
// Website: https://mdabirhossain.com/
//


import Foundation

struct QuizModel: Codable {
    var questions: [Question]?
}

struct Question: Codable {
    let question: String?
    let answers: Answers?
    let questionImageURL: String?
    let correctAnswer: String?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case question, answers
        case questionImageURL = "questionImageUrl"
        case correctAnswer, score
    }
}

struct Answers: Codable {
    let a, b, c, d: String?

    enum CodingKeys: String, CodingKey {
        case a = "A"
        case b = "B"
        case c = "C"
        case d = "D"
    }
}
