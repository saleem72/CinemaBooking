//
//  SeatCardView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct SeatCardView: View {
    let seat: Seat
    var onSelection: (Theatre.Operation) -> Void
    
    init(seat: Seat, onSelection: @escaping (Theatre.Operation) -> Void) {
        self.seat = seat
        self.onSelection = onSelection
    }
    
    var body: some View {
        Image(Asset.seat)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(seat.status.color)
            .frame(width: 30, height: 22)
            .onTapGesture {
                if seat.status == .available {
                    onSelection(.select)
                } else if seat.status == .selected {
                    onSelection(.deSelect)
                }
            }
    }
}

struct SeatCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(hex: "2C135C")
                .edgesIgnoringSafeArea(.all)
            
            SeatCardView(seat: Seat(number: 1, sectionId: 1, sectionName: "Vip", rowId: 1, rowName: "A", status: .available)) { _ in }
        }
    }
}
