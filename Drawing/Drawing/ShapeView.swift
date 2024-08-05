//
//  ShapeView.swift
//  Drawing
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}


struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockWise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: modifiedStartAngle,
            endAngle: modifiedEndAngle,
            clockwise: !clockWise
        )
        
        return path
    }
}

struct ShapeView: View {
    var body: some View {
//        Triangle()
//            .stroke(
//                Gradient(colors: [.red, .blue, .green]),
//                style: StrokeStyle(
//                    lineWidth: 10,
//                    lineCap: .round,
//                    lineJoin: .round
//                )
//            )
//            .frame(width: 300, height: 300)
        
        Arc(
            startAngle: .degrees(0),
            endAngle: .degrees(110),
            clockWise: true
        )
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)

    }
}

#Preview {
    ShapeView()
}
