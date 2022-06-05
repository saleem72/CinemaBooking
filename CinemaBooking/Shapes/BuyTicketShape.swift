//
//  BuyTicketShape.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct BuyTicketShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let height = rect.height
        let width = rect.width
        
        let shift: CGFloat = 0.15
        let radius: CGFloat = 50
        
        let p1 = CGPoint(x: rect.minX, y: rect.minY)
        let p2 = CGPoint(x: rect.maxX, y: rect.minY)
        let p3 = CGPoint(x: rect.maxX, y: rect.minY + (height * 0.5 - radius))
        let p4 = CGPoint(x: rect.maxX - width * shift, y: rect.minY + (height * 0.5 - radius))
        let p6 = CGPoint(x: rect.maxX, y: rect.minY + (height * 0.5 + radius))
        let p7 = CGPoint(x: rect.maxX, y: rect.maxY)
        let p8 = CGPoint(x: rect.minX, y: rect.maxY)
        
        let center = CGPoint(x: rect.maxX - width * shift, y: rect.minY + height * 0.5)
        
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 90), clockwise: true)
        path.addLine(to: p6)
        path.addLine(to: p7)
        path.addLine(to: p8)
        path.addLine(to: p1)
        
        return path
    }
}

struct TestBuyTicketShape: View {
    var body: some View {
        ZStack {
            
            Color(hex: "2C135C")
                .edgesIgnoringSafeArea(.all)
            
            BuyTicketShape()
                .frame(height: 216)
//                .stroke()
        }
    }
}

struct TestBuyTicketShape_Previews: PreviewProvider {
    static var previews: some View {
        TestBuyTicketShape()
    }
}
