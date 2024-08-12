//
// 
// FileName: TimerDurationView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 12:37 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI
import Combine

struct TimerDurationView: View {
    
    @Binding var duration: Int
    @State private var progressWidth: CGFloat = 0
    @State private var connectedTimer: Cancellable? = nil
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Text("Time:")
                    .foregroundColor(Color.black)
                    .font(.system(size: 14, weight: .regular))
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6.5)
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: geo.size.width - 100, height: 13)
                    
                    RoundedRectangle(cornerRadius: 6.5)
                        .fill(Color.darkRed)
                        .frame(maxWidth: CGFloat(progressWidth))
                        .frame(height: 13)
                }
                .onReceive(timer) { time in
                    if duration == 0 {
//                        timer.upstream.connect().cancel()
//                        progressWidth = geo.size.width - 100
                    } else {
                        duration -= 1
                        withAnimation(.linear(duration: 1)) {
                            progressWidth -= CGFloat(geo.size.width - 100) / CGFloat(10)
                        }
                    }
                }
                .onChange(of: duration) { _ in
                    if duration == 10 {
                        withAnimation(.linear(duration: 0.1)) {
                            self.progressWidth = geo.size.width - 100
                        }
                    }
                }
                
                Text("\(String(format: "%02d", duration))sec")
                    .foregroundColor(Color.black)
                    .font(.system(size: 14, weight: .regular))
            }
            .onAppear(perform: {
                duration = 10
                progressWidth = geo.size.width - 100
            })
        }
    }
}

struct TimerDurationView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDurationView(duration: .constant(10))
    }
}


struct AnswerSelectionCellView: View {
    
    @EnvironmentObject var quizViewModel: QuizViewModel
    let index: Int
    
    @State private var selectedAnswer = ""
    
    var body: some View {
        VStack(spacing: 16) {
            let question = quizViewModel.quizData?.questions?[index]
            Button("A.  \(question?.answers?.a ?? "")") {
                checkAnswer(ans: "A")
            }
            .buttonStyle(AnswerSelectionButtonStyle(outputForButton(ans: "A")))
            
            Button("B.  \(question?.answers?.b ?? "")") {
                checkAnswer(ans: "B")
            }
            .buttonStyle(AnswerSelectionButtonStyle(outputForButton(ans: "B")))
            
            Button("C.  \(question?.answers?.c ?? "")") {
                checkAnswer(ans: "C")
            }
            .buttonStyle(AnswerSelectionButtonStyle(outputForButton(ans: "C")))
            
            Button("D.  \(question?.answers?.d ?? "")") {
                checkAnswer(ans: "D")
            }
            .buttonStyle(AnswerSelectionButtonStyle(outputForButton(ans: "D")))
        }
        .disabled(selectedAnswer.isNotEmpty || quizViewModel.duration <= 0)
    }
    
    func outputForButton(ans: String) -> String {
        let answer = quizViewModel.quizData?.questions?[index].correctAnswer
        var value = ""
        
        if selectedAnswer != "" {
            if selectedAnswer == answer && selectedAnswer == ans {
                value = "g"
            } else {
                if selectedAnswer != answer && answer == ans {
                    value = "g"
                } else {
                    if selectedAnswer != answer && selectedAnswer != ans {
                        value = "w"
                    } else {
                        if selectedAnswer != answer && selectedAnswer == ans {
                            value = "r"
                        } else {
                            value = "w"
                        }
                    }
                }
            }
        } else {
            value = "w"
            print("Value6: \(value)")
        }
        
        return value
    }
    
    func checkAnswer(ans: String) {
        selectedAnswer = ans
        if selectedAnswer == quizViewModel.quizData?.questions?[index].correctAnswer {
            quizViewModel.totalCoin += quizViewModel.quizData?.questions?[index].score ?? 0
            quizViewModel.totalCorrectAns += 1
        }
    }
}

struct AnswerSelectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerSelectionCellView(index: 0)
    }
}
