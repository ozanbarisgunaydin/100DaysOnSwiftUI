//
//  StrokeView.swift
//  Drawing
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import SwiftUI

struct InsettableArc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockWise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStartAngle = startAngle - rotationAdjustment
        let modifiedEndAngle = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: (rect.width / 2) - insetAmount,
            startAngle: modifiedStartAngle,
            endAngle: modifiedEndAngle,
            clockwise: !clockWise
        )
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        
        arc.insetAmount += amount
        
        return arc
    }
}

struct StrokeView: View {
    var body: some View {
        InsettableArc(startAngle: .degrees(-90), endAngle: .degrees(90), clockWise: true)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

#Preview {
    StrokeView()
}
