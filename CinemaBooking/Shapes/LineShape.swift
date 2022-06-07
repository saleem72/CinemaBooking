//
//  LineShape.swift
//  CinemaBooking
//
//  Created by Yousef on 6/7/22.
//

import SwiftUI

struct LineShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let p1 = CGPoint(x: rect.minX, y: rect.midY)
        let p2 = CGPoint(x: rect.maxX, y: rect.midY)
        
        path.move(to: p1)
        path.addLine(to: p2)
//        path.addLine(to: p1)
        return path
    }
}
