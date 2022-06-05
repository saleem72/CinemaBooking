//
//  HallLegendView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct HallLegendView: View {
    var body: some View {
        HStack(spacing: 20) {
            ForEach(SeatStatus.allCases) { status in
                HStack {
                    Circle()
                        .fill(status.color)
                        .frame(width: 12, height: 12)
                    Text(status.rawValue.capitalized)
                        .customFont(.body)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }
            }
        }
        .padding(.vertical)
    }
}

struct HallLegendView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(hex: "2C135C")
                .edgesIgnoringSafeArea(.all)
            
            HallLegendView()
        }
    }
}
