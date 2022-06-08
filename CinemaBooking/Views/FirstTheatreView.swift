//
//  FirstTheatreView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct FirstTheatreView: View {
    
    @ObservedObject var theatre: Theatre
    
    var body: some View {
        VStack {
            if theatre.sections.count > 3 {
                VStack(spacing: 0) {
                    HStack {
                        TheatreSectionView(section: theatre.sections[0]) { seat, operation in
                            theatre.updateSelection(for: seat, operation: operation)
                        }
                        
                        TheatreSectionView(section: theatre.sections[1]) { seat, operation in
                            theatre.updateSelection(for: seat, operation: operation)
                        }
                    }
                    
                    TheatreSectionView(section: theatre.sections[2]) { seat, operation in
                        theatre.updateSelection(for: seat, operation: operation)
                    }
                    .padding(.top, 30)
                    
                    TheatreSectionView(section: theatre.sections[3]) { seat, operation in
                        theatre.updateSelection(for: seat, operation: operation)
                    }
                    .padding(.top, 20)
                    
                    TheatreLegendView()
                        .padding(.top, 60)
                }
                .padding(.horizontal)
                
                
            }
        }
    }
}

struct FirstTheatreView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSeatScreen(viewModel: ReservationViewModel.init(movie: .example))
    }
}
