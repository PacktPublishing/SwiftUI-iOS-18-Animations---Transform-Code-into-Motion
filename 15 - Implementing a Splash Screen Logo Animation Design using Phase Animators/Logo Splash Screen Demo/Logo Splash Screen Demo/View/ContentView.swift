//
//  ContentView.swift
//  Logo Splash Screen Demo
//
//  Created by Ron Erez on 29/11/2024.
//

import SwiftUI

struct MainLogoView: View {
    @State private var trigger = false
    
    var body: some View {
        ZStack {}
            .phaseAnimator(
                TextLogoPhases.allCases,
                trigger: trigger) {
                    content,
                    phase in
                    LogoPhasesView(
                        text: "COMPANY",
                        logo: phase.logoModel
                    )
                } animation: { phase in
                    phase.animation
                }
                .onTapGesture {
                    trigger.toggle()
                }

    }
}

#Preview {
    MainLogoView()
}


