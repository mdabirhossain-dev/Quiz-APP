//
//  GradientView.swift
//  Quiz App
//
//  Created by Md Abir Hossain on 10/8/24.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.gradientRed, .gradientOrange]), startPoint: .top, endPoint: .bottom)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
