//
//  Gradients.swift
//  CinemaBooking
//
//  Created by Yousef on 5/31/22.
//

import SwiftUI

enum Gradients {
    static let fullSizeCardBackground = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color.theme.red, location: 0),
            .init(color: Color.theme.blue, location: 1)
        ]),
        startPoint: UnitPoint(x: 0.09999998429417623, y: 1.1958182333238199e-8),
        endPoint: UnitPoint(x: 0.8400000178650024, y: 1.225000002054497)
    )
    
    static let fullSizeCardStroke = LinearGradient(
        gradient:
            Gradient(stops: [
                .init(color: Color.theme.pink, location: 0),
                .init(color: Color.theme.pink.opacity(0), location: 1)
            ]),
        startPoint: UnitPoint(x: 0.10000000238418583, y: 2.9802322831784522e-9),
        endPoint: UnitPoint(x: 0.5000000119209292, y: 0.5000000149011614)
    )
    
    static let smallSizeCardBackground = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color.theme.blue, location: 0),
            .init(color: Color.theme.gray, location: 1)
        ]),
        startPoint: UnitPoint(x: 0.09999998429417623, y: 1.1958182333238199e-8),
        endPoint: UnitPoint(x: 0.8400000178650024, y: 1.225000002054497)
    )
    
    static let smallSizeCardStroke = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: Color.theme.green, location: 0),
            .init(color: Color.theme.green.opacity(0), location: 1)
        ]),
        startPoint: UnitPoint(x: 0.1399999942366032, y: -0.11249998613446943),
        endPoint: UnitPoint(x: 0.49999998308718185, y: 0.5000000190455467)
    )
}
