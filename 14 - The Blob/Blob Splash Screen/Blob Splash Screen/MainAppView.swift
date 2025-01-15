
import SwiftUI

struct MainAppView: View {
    @State private var showSplashScreen = true
    
    var body: some View {
        Group {
            if showSplashScreen {
                MainSplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now()+4) {
                            withAnimation {
                                showSplashScreen = false
                            }
                        }
                    }
            } else {
                MakeFriendsView()
            }
        }
        .transition(.opacity)
    }
}

#Preview {
    MainAppView()
}
