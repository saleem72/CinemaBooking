//
//  StageShape.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct StageShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let p1 = CGPoint(x: rect.minX, y: rect.maxY)
        let p2 = CGPoint(x: rect.maxX, y: rect.maxY)
        let ancor = CGPoint(x: rect.midX, y: -rect.maxY)
        
        path.move(to: p1)
        path.addQuadCurve(to: p2, control: ancor)
        return path
    }
}

struct TestStageShape: View {
    var body: some View {
        ZStack {
            
            Color.theme.background.edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    StageShape()
                        .stroke(Color(hex: "#A9146E"), lineWidth: 10)
                        .blur(radius: 15)
                    
                    StageShape()
                        .stroke(Color.theme.pink, lineWidth: 4)
                }
                .frame(width: 350, height: 36)
            }
        }
    }
}

struct TestStageShape_Previews: PreviewProvider {
    static var previews: some View {
        TestStageShape()
    }
}
