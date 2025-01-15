
import SwiftUI

enum TextLogoPhases: CaseIterable {
    case blackCircle, logoGoesUp, logoGoesToCenter, logoGoesToLeft, textAppears
    
    var logoModel: LogoPhaseModel {
        switch self {
            
        case .blackCircle:
                .init(
                    y: 2,
                    showText: false,
                    percentage: 1,
                    ellipseScale: 1,
                    logoScale: 0.1
                )
        case .logoGoesUp:
                .init(
                    y: -2,
                    showText: false,
                    percentage: 1,
                    ellipseScale: 0,
                    logoScale: 1.2
                )
        case .logoGoesToCenter:
                .init(
                    y: 0,
                    showText: false,
                    percentage: 1,
                    ellipseScale: 0,
                    logoScale: 0.8
                )
        case .logoGoesToLeft:
                .init(
                    y: 0,
                    showText: true,
                    percentage: 0,
                    ellipseScale: 0,
                    logoScale: 1
                )
        case .textAppears:
                .init(
                    y: 0,
                    showText: true,
                    percentage: 1,
                    ellipseScale: 0,
                    logoScale: 1
                )
        }
    }
    
    var animation: Animation {
        switch self {
        case .blackCircle:
            Animation.bouncy(duration: 0)
        case .logoGoesUp:
            Animation.timingCurve(1, 0, 0, 1, duration: 1)
        case .logoGoesToCenter:
            Animation.interpolatingSpring(
                mass: 1,
                stiffness: 100,
                damping: 7,
                initialVelocity: 10
            ).delay(0.5)
        case .logoGoesToLeft:
            Animation.bouncy(duration: 0.3).delay(1)
        case .textAppears:
            Animation.timingCurve(0.47, 0, 0.23, 1.38, duration: 0.9)
        }
    }
}
