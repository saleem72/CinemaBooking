//
//  FirstHallView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct FirstHallView: View {
    
    @ObservedObject var hall: Hall
    
    var body: some View {
        VStack {
            if hall.sections.count > 3 {
                VStack(spacing: 0) {
                    HStack {
                        HallSectionView(section: hall.sections[0]) { seat, operation in
                            hall.updateSelection(for: seat, operation: operation)
                        }
                        
                        HallSectionView(section: hall.sections[1]) { seat, operation in
                            hall.updateSelection(for: seat, operation: operation)
                        }
                    }
                    
                    HallSectionView(section: hall.sections[2]) { seat, operation in
                        hall.updateSelection(for: seat, operation: operation)
                    }
                    .padding(.top, 30)
                    
                    HallSectionView(section: hall.sections[3]) { seat, operation in
                        hall.updateSelection(for: seat, operation: operation)
                    }
                    .padding(.top, 20)
                    
                    HallLegendView()
                        .padding(.top, 60)
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

struct FirstHallView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSeatScreen(viewModel: ReservationViewModel.init())
    }
}
