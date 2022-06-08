//
//  TheatreSectionView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct TheatreSectionView: View {
    let section: TheatreSection
    var onSelection: (Seat, Theatre.Operation) -> Void
    
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

struct TheatreSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSeatScreen(viewModel: ReservationViewModel.init(movie: .example))
    }
}
