//
//  SpeechBubble.swift
//  Particle Animations
//
//  Created by Ron Erez on 01/01/2025.
//

import SwiftUI

struct SpeechBubble: Shape {
    let tailWidth: CGFloat
    let tailHeight: CGFloat
    let cornerRadius: CGFloat
    init(
        tailWidth: CGFloat = 20.0,
        tailHeight: CGFloat = 15.0,
        cornerRadius: CGFloat = 15.0
    ) {
        self.tailWidth = tailWidth
        self.tailHeight = tailHeight
        self.cornerRadius = cornerRadius
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tailStart = CGPoint(
            x: rect.midX - tailWidth / 2,
            y: rect.maxY
        )
        let tailEnd = CGPoint(
            x: rect.midX + tailWidth / 2,
            y: rect.maxY
        )
        path.move(to: tailStart)
        path.addLine(
            to: CGPoint(
                x: rect.midX,
                y: rect.maxY + tailHeight
            )
        )
        path.addLine(to: tailEnd)
        // Lower right corner
        path
            .addArc(
                tangent1End: CGPoint(
                    x: rect.maxX,
                    y: rect.maxY
                ),
                tangent2End: CGPoint(
                    x: rect.maxX,
                    y: rect.maxY - cornerRadius
                ),
                radius: cornerRadius
            )
        
        // Go to top right
        path
            .addArc(
                tangent1End: CGPoint(
                    x: rect.maxX,
                    y: rect.minY
                ),
                tangent2End: CGPoint(
                    x: rect.maxX - cornerRadius,
                    y: rect.minY
                ),
                radius: cornerRadius
            )
        
        // Top left
        path
            .addArc(
                tangent1End: CGPoint(
                    x: rect.minX,
                    y: rect.minY
                ),
                tangent2End: CGPoint(
                    x: rect.minX,
                    y: rect.minY + cornerRadius
                ),
                radius: cornerRadius
            )
        
        // Bottom left
        path
            .addArc(
                tangent1End: CGPoint(
                    x: rect.minX,
                    y: rect.maxY
                ),
                tangent2End: CGPoint(
                    x: rect.minX + cornerRadius,
                    y: rect.maxY
                ),
                radius: cornerRadius
            )
        
        path.closeSubpath()
        
        return path
    }
}
