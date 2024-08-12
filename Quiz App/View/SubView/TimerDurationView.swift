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
//    @Binding var question: Question
    let index: Int
    
    var selectedAnswer: Bool {
        return false
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Button(quizViewModel.quizData?.questions?[index].answers?.a ?? "") {
                
            }
            .buttonStyle(AnswerSelectionButtonStyle(false))
            
            Button(quizViewModel.quizData?.questions?[index].answers?.b ?? "") {
                
            }
            .buttonStyle(AnswerSelectionButtonStyle(true))
            
            Button(quizViewModel.quizData?.questions?[index].answers?.c ?? "") {
                
            }
            .buttonStyle(AnswerSelectionButtonStyle(nil))
            
            Button(quizViewModel.quizData?.questions?[index].answers?.d ?? "") {
                
            }
            .buttonStyle(AnswerSelectionButtonStyle(nil))
        }
    }
}

struct AnswerSelectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerSelectionCellView(index: 0)
    }
}
