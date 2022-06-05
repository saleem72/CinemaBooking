//
//  ScreenView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct ScreenView: View {
    var body: some View {
        ZStack {
            StageShape()
                .stroke(Color(hex: "#A9146E"), lineWidth: 10)
                .blur(radius: 15)
            
            StageShape()
                .stroke(Color(hex: "FF53C0"), lineWidth: 5)
        }
        .frame(width: 350, height: 36)
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
    }
}
