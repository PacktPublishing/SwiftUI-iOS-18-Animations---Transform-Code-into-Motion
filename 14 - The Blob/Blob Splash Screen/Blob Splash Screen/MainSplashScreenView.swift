//
//  MainSplashScreenView.swift
//  Blob Splash Screen
//
//  Created by Ron Erez on 29/11/2024.
//

import SwiftUI

enum SplashPhases: CaseIterable {
    case initial, expandBlob
    
    var blobZoom: Double {
        switch self {
        case .initial: 1
        case .expandBlob: 20
        }
    }
    var blobColor: Color {
        switch self {
        case .initial: .deepPurple
        case .expandBlob: .purple
        }
    }
    var welcomeColor: Color {
        switch self {
        case .initial: .black
        case .expandBlob: .white
        }
    }
    var welcomeOpacity: Double {
        switch self {
        case .initial: 0
        case .expandBlob: 1
        }
    }
    var offset: Double {
        switch self {
        case .initial: 0
        case .expandBlob: -50
        }
    }
}

struct MainSplashScreenView: View {
    @State private var trigger = false
    
    var body: some View {
        Color
            .blue.opacity(0.3)
            .ignoresSafeArea()
            .phaseAnimator(
                SplashPhases.allCases,
                trigger: trigger) {
                    content,
                    phase in
                    content
                        .overlay(
                            SplashScreenView(
                                blobZoom: phase.blobZoom,
                                blobColor: phase.blobColor,
                                welcomeColor: phase.welcomeColor,
                                welcomeOpacity: phase.welcomeOpacity,
                                offset: phase.offset
                            )
                        )
                } animation: { phase in
                    .easeInOut(duration: 2).delay(1)
                }
                .onAppear {
                    trigger.toggle()
                }
    }
}

#Preview {
    MainSplashScreenView()
}
