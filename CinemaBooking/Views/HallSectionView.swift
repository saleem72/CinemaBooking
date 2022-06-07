//
//  HallSectionView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct HallSectionView: View {
    let section: HallSection
    var onSelection: (Seat, Hall.Operation) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(section.rows) { row in
                HStack(spacing: 10) {
                    ForEach(row.seats) { seat in
                        SeatCardView(seat: seat) { operation in
                            onSelection(seat, operation)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct HallSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSeatScreen(viewModel: ReservationViewModel.init(movie: .example))
    }
}
