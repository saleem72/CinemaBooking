//
//  Theatre.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI



class Theatre: ObservableObject {
    
    enum Operation {
        case select
        case deSelect
    }
    
    @Published private(set) var sections: [TheatreSection] = []
    @Published private(set) var selectedSeats: [Seat] = []
    @Published private(set) var showBottomCard: Bool = false
    
    var selectedSeatsNumbers: String {
        selectedSeats.map({String($0.number)}).joined(separator: ", ")
    }
    
    func priceForSection(_ id: Int) -> Double {
        if let sec = sections.first(where: {$0.id == id}) {
            return sec.seatPrice
        } else {
            return 0
        }
    }
    
    // "Total: $30"
    var totalPrice: String {
        let temp = selectedSeats.map({priceForSection($0.sectionId)}).reduce(0, +)
        return String(format: "Total: $%.2f", temp)
    }
    
    private var provider: TheatreSeatsProvider = .init()
    
    func getData() {
        sections = provider.getTheatre()
    }
    
    private func checkForBottomCard() {
        if selectedSeats.count == 0 {
            withAnimation {
                showBottomCard = false
            }
        } else {
            withAnimation {
                showBottomCard = true
            }
        }
    }
    
    private func selectSeat(_ seat: Seat) {
        guard let sectionIdx = sections.firstIndex(where: {$0.id == seat.sectionId}) else { return }
        
        guard let rowIdx = sections[sectionIdx].rows.firstIndex(where: {$0.id == seat.rowId}) else { return }
        
        guard let seatIdx = sections[sectionIdx].rows[rowIdx].seats.firstIndex(where: {$0.number == seat.number}) else { return }
        
        sections[sectionIdx].rows[rowIdx].seats[seatIdx] = seat.setSelected(true)
        selectedSeats.append(seat)
        checkForBottomCard()
    }
    
    private func deSelectSeat(_ seat: Seat) {
        guard let sectionIdx = sections.firstIndex(where: {$0.id == seat.sectionId}) else { return }
        
        guard let rowIdx = sections[sectionIdx].rows.firstIndex(where: {$0.id == seat.rowId}) else { return }
        
        guard let seatIdx = sections[sectionIdx].rows[rowIdx].seats.firstIndex(where: {$0.number == seat.number}) else { return }
        
        sections[sectionIdx].rows[rowIdx].seats[seatIdx] = seat.setSelected(false)
        if let idx = selectedSeats.firstIndex(where: {$0.id == seat.id}) {
            selectedSeats.remove(at: idx)
        }
        checkForBottomCard()
    }
    
    func updateSelection(for seat: Seat, operation: Operation) {
        switch operation {
        case .select: selectSeat(seat)
        case .deSelect: deSelectSeat(seat)
        }
    }
}
