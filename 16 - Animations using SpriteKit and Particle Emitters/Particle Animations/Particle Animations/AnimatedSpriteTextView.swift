
import SwiftUI
import SpriteKit

struct AnimatedSpriteTextView<Background:Shape>: View {
    let width: CGFloat
    let height: CGFloat
    let text: String
    let backgroundShape: Background
    let backgroundColor: Color
    @Binding var hideText: Bool
    @State private var showLeftRightSprites = false
    
    var mainScene: SKScene {
        createScene(
            dx: width * 0.7,
            life: 0.5,
            xAcceleration: 0.5
        )
    }
    
    let acc = 150.0
    
    var leftScene: SKScene {
        createScene(
            dx: width * 2,
            life: 2,
            xAcceleration: -acc
        )
    }
    var rightScene: SKScene {
        createScene(
            dx: width * 2,
            life: 2,
            xAcceleration: acc
        )
    }
    
    var LeftRightSprites: some View {
        ZStack {
            SpriteView(scene: leftScene, options: [.allowsTransparency])
                .offset(x: -width * 0.65)
            
            SpriteView(scene: rightScene, options: [.allowsTransparency])
                .offset(x: width * 0.65)
        }
    }
    var mainSprites: some View {
        SpriteView(scene: mainScene, options: [.allowsTransparency])
            .opacity(hideText ? 1 : 0)
    }
    
    var body: some View {
        ZStack {
            TextWithBackground(
                text: text,
                backgroundShape: backgroundShape,
                backgroundColor: backgroundColor,
                textOpacity: hideText ? 0 : 1
            )
            
            mainSprites
            
            LeftRightSprites
                .opacity(showLeftRightSprites ? 0.85 : 0.0)
            
        }
        .frame(width: width, height: height)
        .onChange(of: hideText) { _, _ in
            handleToggle()
        }
    }
    
    private func handleToggle() {
        if !hideText {
            withAnimation(.snappy(duration: 0.1)) {
                showLeftRightSprites.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) {
                withAnimation(.easeInOut(duration: 0.1)) {
                    showLeftRightSprites.toggle()
                }
            }
        }
    }
    
    private func createScene(dx: CGFloat, life: CGFloat, xAcceleration: CGFloat) -> SKScene {
        let scene = GameScene(
            size: CGSize(width: width, height: height),
            dx: dx,
            dy: height/2,
            velocity: 20,
            life: life,
            birthRate: 200,
            xAcceleration: xAcceleration,
            yAcceleration: 0
        )
        scene.scaleMode = .fill
        
        return scene
    }
}

#Preview {
    AnimatedSpriteTextView(
        width: 300,
        height: 90,
        text: "Hidden Text",
        backgroundShape: SpeechBubble(),
        backgroundColor: .blue,
        hideText: .constant(true)
    )
}
