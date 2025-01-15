//
//  LogoPhasesView.swift
//  Logo Splash Screen Demo
//
//  Created by Ron Erez on 30/11/2024.
//

import SwiftUI

struct LogoPhasesView: View {
    let text: String
    let logo: LogoPhaseModel
    
    let ellipseWidthFactor = 3.5
    let ellipseHeightFactor = 1.0
    let ellipseOffsetFactor = 0.5
    
    let rectWidthFactor = 3.5
    let rectHeightFactor = 3.5
    let rectOffsetFactor = -1.25
    
    func mask(logoSize: Double) -> some View {
        ZStack {
            Ellipse()
                .frame(
                    width: ellipseWidthFactor * logoSize,
                    height: ellipseHeightFactor * logoSize
                )
                .offset(y: ellipseOffsetFactor * logoSize)
            
            Rectangle()
                .frame(
                    width: rectWidthFactor * logoSize,
                    height: rectHeightFactor * logoSize
                )
                .offset(y: rectOffsetFactor * logoSize)
        }
    }
    
    func icon(logoSize: Double) -> some View {
        Image(.leafIcon)
            .resizable()
            .padding()
            .frame(width: logoSize, height: logoSize)
            .background(.green)
            .clipShape(Circle())
            .scaleEffect(logo.logoScale)
            .offset(y: logo.y * logoSize)
    }
    
    func ellipseShadow(logoSize: Double) -> some View {
        Ellipse()
            .scaleEffect(logo.ellipseScale)
            .frame(
                width: ellipseWidthFactor * logoSize,
                height: ellipseHeightFactor * logoSize
            )
            .offset(y: ellipseOffsetFactor * logoSize)
    }
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let logoSize = size.width / 5
            
            ZStack {
                Color.darkGreen.ignoresSafeArea()
                
                ZStack {
                    ellipseShadow(logoSize: logoSize)
                    
                    HStack {
                        icon(logoSize: logoSize)
                            .mask {
                                mask(logoSize: logoSize)
                            }
                        
                        if logo.showText {
                            PercentageTextView(
                                text: text,
                                percentage: logo.percentage
                            )
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LogoPhasesView(
        text: "COMPANY",
        logo: .init(
            y: 0,
            showText: true,
            percentage: 1,
            ellipseScale: 0,
            logoScale: 1
        )
    )
}


