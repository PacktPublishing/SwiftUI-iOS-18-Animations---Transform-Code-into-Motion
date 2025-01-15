
import SwiftUI

struct AnimatedLogoView: View {
    let dim: CGFloat
    let name: String
    let bgGradient1: LinearGradient
    let bgGradient2: LinearGradient
    let fgColor1: Color
    let fgColor2: Color
    init(
        dim: CGFloat = 24.0,
        name: String = "Hello",
        bgGradient1: LinearGradient = LinearGradient(colors: [.black], startPoint: .topLeading, endPoint: .bottomTrailing),
        bgGradient2: LinearGradient = LinearGradient(colors: [.blueViolet, .iris, .oceanBlue1], startPoint: .topLeading, endPoint: .bottomTrailing),
        fgColor1: Color = .purple,
        fgColor2: Color = .white
    ) {
        self.dim = dim
        self.name = name
        self.bgGradient1 = bgGradient1
        self.bgGradient2 = bgGradient2
        self.fgColor1 = fgColor1
        self.fgColor2 = fgColor2
    }
    
    var backgroundPhase1: Bool {
        !showText
    }
    
    var fgColor: Color {
        if showText {
            return fgColor2
        } else {
            return backgroundPhase1 ? fgColor1 : fgColor2
        }
    }
    
    var bgColor: LinearGradient {
        backgroundPhase1 ? bgGradient1 : bgGradient2
    }
    
    var smallSquare: some View {
        Rectangle()
            .fill(fgColor)
            .frame(width: dim, height: dim)
    }
    var leftRectangle: some View {
        VStack(spacing: spacing) {
            smallSquare
            smallSquare
        }
        .overlay {
            fgColor
        }
    }
    
    var logo: some View {
        HStack(spacing: spacing) {
            leftRectangle
            
            VStack(spacing: spacing) {
                smallSquare
                smallSquare
            }
        }
    }
    var text: some View {
        Text(name)
            .foregroundStyle(fgColor)
            .font(.system(size: dim * 2 + spacing * 2, weight: .bold, design: .rounded))
            .lineLimit(1)
            .minimumScaleFactor(0.1)
            .clipShape(
                Rectangle()
                    .offset(x: clipWidth)
            )
    }
    
    let spacing: CGFloat = 3.0
    
    @State private var rotation = 0.0
    @State private var scale = 1.0
    @State private var showText = false
    @State private var clipWidth = -130.0
    
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            HStack {
                logo
                    .rotationEffect(.degrees(rotation))
                    .scaleEffect(scale)
                
                if showText {
                    text
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4)) {
                rotation = 135.0
                scale = 2.0
            } completion: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.4)) {
                    rotation = 0.0
                    scale = 1.0
                } completion: {
                    withAnimation(
                        .interpolatingSpring(
                            mass: 1,
                            stiffness: 150,
                            damping: 15,
                            initialVelocity: 0
                        ).delay(0.8)
                    ) {
                        showText = true
                        clipWidth = 0.0
                    }
                }
            }
        }
    }
}

#Preview {
//    AnimatedLogoView()
//    AnimatedLogoView(bgGradient2: LinearGradient(colors: [.oceanBlue1, .oceanBlue2], startPoint: .topLeading, endPoint: .bottomTrailing))
    AnimatedLogoView(name: "NICE", bgGradient2: LinearGradient(colors: [.sanguine1, .sanguine2], startPoint: .topLeading, endPoint: .bottomTrailing), fgColor1: .sanguine1)
}
