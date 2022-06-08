//
//  SessionManager.swift
//  CinemaBooking
//
//  Created by Yousef on 6/7/22.
//

import Foundation

final class SessionManager: ObservableObject {
    @Published var selectedMovie: MovieViewModel? = nil
    @Published var showSeatsMap: Bool = false
    @Published var showBoughtTicket: Bool = false
    
    func goBackHome() {
        showBoughtTicket = false
        showSeatsMap = false
        selectedMovie = nil
    }
}
