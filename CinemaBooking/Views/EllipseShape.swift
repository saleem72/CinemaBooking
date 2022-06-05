//
//  EllipseShape.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI

struct EllipseShape: Shape {
    func path(in rect: CGRect) -> Path {
        let ellipse = UIBezierPath(ovalIn: rect)
        return Path(ellipse.cgPath)
    }
}

struct Ellipse_Previews: PreviewProvider {
    static var previews: some View {
        EllipseShape()
    }
}
