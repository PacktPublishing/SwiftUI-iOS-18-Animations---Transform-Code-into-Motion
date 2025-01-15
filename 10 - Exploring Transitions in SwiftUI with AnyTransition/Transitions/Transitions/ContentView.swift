//
//  ContentView.swift
//  Transitions
//
//  Created by Ron Erez on 02/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isVisible = false
    
    var body: some View {
        VStack {
            Button("Toggle View") {
                withAnimation {
                    isVisible.toggle()
                }
            }
            
            if isVisible {
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .overlay {
                        Text("HELLO")
                            .foregroundStyle(.red)
                            .bold()
                    }
//                    .transition(.scale)
//                    .transition(.opacity)
//                    .transition(.move(edge: .top))
//                    .transition(.scale.combined(with: .move(edge: .leading)))
                    .transition(
                        .asymmetric(
                            insertion: .opacity
                                .animation(.spring())
                                .combined(with: .scale(scale: 0.5, anchor: .bottomLeading)),
                            removal: .opacity
                                .animation(.spring())
                                .combined(with: .scale(scale: 0.5, anchor: .bottomTrailing))
                        )
                    )
            }
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
