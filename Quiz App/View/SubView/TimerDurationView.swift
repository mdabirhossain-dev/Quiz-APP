//
// 
// FileName: TimerDurationView.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 12:37 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct TimerDurationView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var duration = 10
    @State private var progressWidth = 0
    
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
                    print("geoo: \(geo.size.width)")
                    if duration == 0 {
                        timer.upstream.connect().cancel()
                    } else {
                        duration -= 1
                        withAnimation(.linear(duration: 1)) {
                            progressWidth += Int(geo.size.width - 100) / 10
                            print("The time is now \(time)")
                        }
                    }
                }
                
                Text("\(String(format: "%02d", duration))sec")
                    .foregroundColor(Color.black)
                    .font(.system(size: 14, weight: .regular))
            }
        }
    }
}

//struct TimerDurationView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerDurationView()
//    }
//}


struct AnswerSelectionCellView: View {
    
//    @Binding var questionOptions: Bool
    
    var selectedAnswer: Bool {
        
        return false
    }
    
    var body: some View {
        VStack {
            Button("Question Title") {
                
            }
            .buttonStyle(AnswerSelectionButtonStyle(selectedAnswer))
        }
    }
}

struct AnswerSelectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerSelectionCellView()//(questionOptions: .constant(false))
    }
}
