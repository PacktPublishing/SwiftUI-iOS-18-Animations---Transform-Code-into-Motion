//
//  MyBlob.swift
//  Blob Splash Screen
//
//  Created by Ron Erez on 29/11/2024.
//
import SwiftUI

struct MyBlob: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99708*width, y: 0.82445*height))
        path.addCurve(to: CGPoint(x: 0.94496*width, y: 0.93476*height), control1: CGPoint(x: 1.00823*width, y: 0.9064*height), control2: CGPoint(x: 0.97626*width, y: 0.9657*height))
        path.addCurve(to: CGPoint(x: 0.42523*width, y: 0.94545*height), control1: CGPoint(x: 0.635*width, y: 0.62848*height), control2: CGPoint(x: 0.64982*width, y: 0.94545*height))
        path.addCurve(to: CGPoint(x: 0.05374*width, y: 0.42424*height), control1: CGPoint(x: 0.18587*width, y: 0.94545*height), control2: CGPoint(x: -0.12266*width, y: 1.23885*height))
        path.addCurve(to: CGPoint(x: 0.57243*width, y: 0.00358*height), control1: CGPoint(x: 0.25701*width, y: 0.12121*height), control2: CGPoint(x: 0.33306*width, y: 0.00358*height))
        path.addCurve(to: CGPoint(x: 0.99708*width, y: 0.82445*height), control1: CGPoint(x: 0.77511*width, y: 0.00358*height), control2: CGPoint(x: 0.94865*width, y: 0.46856*height))
        path.closeSubpath()
        return path
    }
}
