//
//  TicketShape.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI

struct TicketShape: Shape {
    var cornerRadius: CGFloat = 20
    var radius: CGFloat = 20
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
//        let p1 = CGPoint(x: rect.minX + cornerRadius, y: rect.minY)
        let p2 = CGPoint(x: rect.maxX - cornerRadius, y: rect.minY)
        let p3 = CGPoint(x: rect.maxX, y: rect.minY + height * 0.71)
        let p4 = CGPoint(x: rect.maxX, y: rect.maxY - 20)
        let p5 = CGPoint(x: rect.minX + cornerRadius, y: rect.maxY)
        let p6 = CGPoint(x: rect.minX, y: rect.minY + height * 0.71)
        let p7 = CGPoint(x: rect.minX, y: rect.minY + cornerRadius)
        path.move(to: p7)
        
        path.addArc(
            center: CGPoint(x: cornerRadius, y: cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 270),
            clockwise: false
        )
        
        path.addLine(to: p2)
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(x: p3.x, y: p3.y - radius))
        
        path.addArc(
            center: p3,
            radius: radius,
            startAngle: Angle(degrees: 270),
            endAngle: Angle(degrees: 90),
            clockwise: true
        )
        
        path.addLine(to: p4)
        path.addArc(
            center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )
        
        path.addLine(to: p5)
        path.addArc(
            center: CGPoint(x: cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )
        
        
        path.addLine(to: CGPoint(x: p6.x, y: p6.y + radius))
        
        path.addArc(
            center: p6,
            radius: radius,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 270),
            clockwise: true
        )
        
        
        path.addLine(to: p7)
        return path
    }
}

struct TicketShape_Previews: PreviewProvider {
    static var previews: some View {
        TicketShape()
            .stroke()
            .frame(width: 250, height: 460)
    }
}
