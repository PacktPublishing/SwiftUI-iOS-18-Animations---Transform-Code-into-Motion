//
//  LittleImageView.swift
//  Blob Splash Screen
//
//  Created by Ron Erez on 29/11/2024.
//

import SwiftUI

struct LittleImageView: View {
    let image: ImageResource
    let width: CGFloat
    let height: CGFloat
    init(image: ImageResource, width: CGFloat=100, height: CGFloat=100) {
        self.image = image
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
    }
}
