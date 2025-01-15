

import SwiftUI

struct MaskDemoView: View {
//    let fontSize = 64.0
//    let color1: Color = .red
//    let color2: Color = .yellow
//    let color3: Color = .purple
//    
//    let str1: String = "MA"
//    let str2: String = "SK"
//    let str3: String = "ING"
//
//    let duration: CGFloat = 1.0
//    let bgColorList: [Color] = [
//        .red, .blue, .green
//    ]
    
    let fontSize: Double
    let color1: Color
    let color2: Color
    let color3: Color
    
    let str1: String
    let str2: String
    let str3: String
    
    let duration: CGFloat
    let bgColorList: [Color]
    
    init(
        fontSize: Double = 64.0,
        color1: Color = .red,
        color2: Color = .yellow,
        color3: Color = .purple,
        str1: String = "MA",
        str2: String = "SK",
        str3: String = "ING",
        duration: CGFloat = 1.0,
        bgColorList: [Color] = [.red, .blue, .green]
    ) {
        self.fontSize = fontSize
        self.color1 = color1
        self.color2 = color2
        self.color3 = color3
        self.str1 = str1
        self.str2 = str2
        self.str3 = str3
        self.duration = duration
        self.bgColorList = bgColorList
    }
    
    var str: String {
        str1 + str2 + str3
    }
    
    var colorfulText: some View {
        HStack(spacing: 0) {
            Text(str1)
                .foregroundStyle(color1)
            
            Text(str2)
                .foregroundStyle(color2)
            
            Text(str3)
                .foregroundStyle(color3)
        }
        .font(.system(size: fontSize, weight: .bold, design: .rounded))
        .padding()
    }
    
    var maskedText: some View {
        Text(str)
            .font(.system(size: fontSize, weight: .bold, design: .rounded))
            .padding()
            .background(bgColor)
    }
    
    @State private var index = 0
    var phases: [CGSize] {
        [
            .init(
                width: fontSize * (-1.85),
                height: fontSize * (1/3)
            ),
            .init(
                width: fontSize * (-0.8),
                height: fontSize * (1/5)
            ),
            .init(
                width: fontSize * (-0.3),
                height: fontSize * 0
            ),
            .init(
                width: fontSize * 0.9,
                height: fontSize * (1/3)
            ),
            .init(
                width: fontSize * 2.03,
                height: fontSize * (-1/4)
            )
            
        ]
    }
    
    var maskOffset: CGSize {
        phases[index]
    }

    var bgColor: Color {
        bgColorList[index % bgColorList.count]
    }
    
    var mask: some View {
        Circle()
            .frame(width: fontSize, height: fontSize)
            .offset(maskOffset)
    }

    
    var body: some View {
        ZStack {
            colorfulText
            
            maskedText
                .mask {
                    mask
                }
                
            
        }
        .onAppear {
            var count = 0
            Timer
                .scheduledTimer(
                    withTimeInterval: duration,
                    repeats: true) { timer in
                        withAnimation(.easeInOut(duration: duration)) {
                            index = (index + 1) % phases.count
                        }
                        count += 1
                        if count >= phases.count {
                            timer.invalidate()
                        }
                    }
        }
        .onTapGesture {
            index = 0
            
            var count = 0
            Timer
                .scheduledTimer(
                    withTimeInterval: duration,
                    repeats: true) { timer in
                        withAnimation(.easeInOut(duration: duration)) {
                            index = (index + 1) % phases.count
                        }
                        count += 1
                        if count >= phases.count {
                            timer.invalidate()
                        }
                    }
        }
    }
}

#Preview {
    VStack {
        MaskDemoView()
        MaskDemoView(
            fontSize: 42.0,
            color1: .red,
            color2: .yellow,
            color3: .purple,
            str1: "Happy ",
            str2: "New ",
            str3: "Year",
            duration: 0.5,
            bgColorList: [.red])
        MaskDemoView(
            fontSize: 42.0,
            color1: .blue,
            color2: .purple,
            color3: .gray,
            str1: "HE",
            str2: "LLO",
            str3: " WORLD",
            duration: 3,
            bgColorList: [.black.opacity(0.5), .white, .indigo])
    }
}
