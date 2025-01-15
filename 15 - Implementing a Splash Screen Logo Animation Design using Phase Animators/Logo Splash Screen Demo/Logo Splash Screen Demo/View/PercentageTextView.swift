//
//  PercentageTextView.swift
//  Logo Splash Screen Demo
//
//  Created by Ron Erez on 30/11/2024.
//

import SwiftUI

struct PercentageTextView: View {
    let text: String
    let percentage: Double
    
    var body: some View {
        Text(text)
            .mask {
                Rectangle()
                    .scale(x: percentage, anchor: .leading)
            }
    }
}

#Preview {
    VStack {
        ForEach(0 ..< 10) { i in
            PercentageTextView(
                text: "COMPANY",
                percentage: CGFloat(i) / 10.0
            )
        }
        .font(.largeTitle)
        .bold()
    }
}
