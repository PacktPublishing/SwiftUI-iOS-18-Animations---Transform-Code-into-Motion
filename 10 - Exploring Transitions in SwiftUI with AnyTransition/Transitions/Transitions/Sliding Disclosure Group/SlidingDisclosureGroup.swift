
import SwiftUI

struct SlidingDisclosureGroup: View {
    let title: String
    let detailedText: String
    let radius: CGFloat
    let fillColor: Color
    
    init(
        title: String,
        detailedText: String,
        radius: CGFloat = 10.0,
        fillColor: Color = .secondary
    ) {
        self.title = title
        self.detailedText = detailedText
        self.radius = radius
        self.fillColor = fillColor
    }
    
    @State private var isExpanded = false
    
    var titleClipShape: UnevenRoundedRectangle {
        UnevenRoundedRectangle(
            topLeadingRadius: radius,
            bottomLeadingRadius: isExpanded ? 0 : radius,
            bottomTrailingRadius: isExpanded ? 0 : radius,
            topTrailingRadius: radius,
            style: .circular
        )
    }
    var detailedTextClipShape: UnevenRoundedRectangle {
        UnevenRoundedRectangle(
            topLeadingRadius: 0,
            bottomLeadingRadius: radius,
            bottomTrailingRadius: radius,
            topTrailingRadius: 0,
            style: .circular
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(LocalizedStringKey(title))
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isExpanded.toggle()
                        }
                    }
            }
            .padding()
            .background(fillColor)
            .clipShape(titleClipShape)
            
            if isExpanded {
                Text(LocalizedStringKey(detailedText))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(fillColor)
                    .clipShape(detailedTextClipShape)
                    .transition(.opacity.combined(with: .slide))
            }
        }
    }
}

#Preview {
    SlidingDisclosureGroup(
        title: "How do I use an accordion?",
        detailedText: "An accordion is a UI component used to show and hide content dynamically when toggled."
    ).padding()
}
