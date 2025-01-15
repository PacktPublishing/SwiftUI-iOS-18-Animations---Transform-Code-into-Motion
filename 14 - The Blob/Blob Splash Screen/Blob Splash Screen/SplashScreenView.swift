
import SwiftUI

struct SplashScreenView: View {
    let blobZoom: Double
    let blobColor: Color
    let welcomeColor: Color
    let welcomeOpacity: Double
    let offset: Double
    
    var body: some View {
        VStack {
            Spacer()
            MyBlob()
                .fill(blobColor.gradient)
                .frame(width: 250, height: 250)
                .scaleEffect(blobZoom)
                .overlay {
                    HStack(spacing: -50) {
                        LittleImageView(image: ._044)
                        LittleImageView(image: ._021)
                        LittleImageView(image: ._054)
                    }
                }
            
            Spacer()
            
            Text("WELCOME")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(welcomeColor)
                .opacity(welcomeOpacity)
            
            Spacer()
            Spacer()
        }
        .offset(y: offset)
    }
}

#Preview {
    SplashScreenView(
        blobZoom: 1,
        blobColor: .deepPurple,
        welcomeColor: .black,
        welcomeOpacity: 0.3,
        offset: -50
    )
}


