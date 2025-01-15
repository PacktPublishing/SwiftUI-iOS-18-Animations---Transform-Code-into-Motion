//
//  FAQView.swift
//  Transitions
//
//  Created by Ron Erez on 02/12/2024.
//

import SwiftUI

struct FAQItem: Identifiable {
    let id = UUID()
    
    let question: String
    let answer: String
}

struct FAQView: View {
    let faqItems: [FAQItem] = [
        FAQItem(
            question: "What is SwiftUI?",
            answer: """
            SwiftUI is a modern, declarative framework developed by Apple for building user interfaces seamlessly across all Apple platforms, including iOS, macOS, watchOS, and tvOS. 
            It allows developers to write UI code that is reusable, efficient, and easy to maintain. SwiftUI employs a declarative syntax, meaning you describe the UI and its behavior in code, and the framework takes care of the rendering and updates automatically. 
            This framework integrates tightly with Swift, offering features like live previews, real-time feedback, and compatibility with Apple's latest design guidelines.
            """
        ),
        FAQItem(
            question: "How do I use an accordion?",
            answer: """
            An accordion is a UI component designed to organize and display content dynamically by expanding and collapsing sections. 
            When a user interacts with an accordion's header, it toggles the visibility of the associated content, which can be a block of text, images, or other interactive elements. 
            Accordions are particularly useful for improving navigation and saving space on a page by hiding details until needed. In SwiftUI, you can implement an accordion-like component using views like `DisclosureGroup` or by combining `Toggle` and `VStack` with conditional rendering to show and hide content smoothly.
            """
        ),
        FAQItem(
            question: "What platforms support SwiftUI?",
            answer: """
            SwiftUI is a versatile framework supported across all major Apple platforms, ensuring a unified codebase for user interface development. 
            These platforms include:
            - **iOS:** For building apps on iPhones and iPads.
            - **macOS:** For creating applications for Mac computers.
            - **watchOS:** To design interfaces tailored for the Apple Watch.
            - **tvOS:** For apps on Apple TV with user-friendly navigation and layouts.
            By using SwiftUI, developers can write once and deploy their UI across these platforms, leveraging platform-specific design guidelines and features for a native experience.
            """
        )
,
    ]
    
    var body: some View {
        ScrollView {
            VStack {
//                ForEach(faqItems) { item in
//                    SlidingDisclosureGroup(
//                        title: item.question,
//                        detailedText: item.answer
//                    )
//                }
                SlidingDisclosureGroup(
                    title: faqItems[0].question,
                    detailedText: faqItems[0].answer,
                    fillColor: .orange.opacity(0.2)
                )
                SlidingDisclosureGroup(
                    title: faqItems[1].question,
                    detailedText: faqItems[1].answer,
                    fillColor: .red.opacity(0.2)
                )
                SlidingDisclosureGroup(
                    title: faqItems[2].question,
                    detailedText: faqItems[2].answer,
                    fillColor: .green.opacity(0.2)
                )
            }
        }.padding()
    }
}

#Preview {
    FAQView()
}
