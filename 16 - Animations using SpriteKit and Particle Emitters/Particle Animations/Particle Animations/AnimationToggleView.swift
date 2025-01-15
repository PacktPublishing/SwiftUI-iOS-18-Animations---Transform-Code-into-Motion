//
//  AnimationToggleView.swift
//  Particle Animations
//
//  Created by Ron Erez on 01/01/2025.
//

import SwiftUI

struct AnimationToggleView: View {
    @State private var hideText = true
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                AnimatedSpriteTextView(
                    width: 300,
                    height: 90,
                    text: "Hidden Text",
                    backgroundShape: SpeechBubble(
                        tailWidth: 15,
                        tailHeight: 20,
                        cornerRadius: 50
                    ),
                    backgroundColor: .blue,
                    hideText: $hideText
                )
                
                Spacer()
                
                Button {
                    hideText.toggle()
                } label: {
                    Label("Toggle Animation", systemImage: hideText ? "eye.slash" : "eye")
                        .font(.headline)
                        .padding()
                        .foregroundStyle(.white)
                        .background(hideText ? .red : .purple)
                        .clipShape(.rect(cornerRadius: 15))
                        .shadow(radius: 5)
                }
            }
            .navigationTitle("Particle Animations")
        }
    }
}

#Preview {
    AnimationToggleView()
}
