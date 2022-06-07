//
//  ReservationViewModel.swift
//  CinemaBooking
//
//  Created by Yousef on 6/6/22.
//

import SwiftUI
import Combine
import CoreImage
import CoreImage.CIFilterBuiltins



class ReservationViewModel: ObservableObject {
    @Published var selectedDate = Date()
    @Published var selectedTime: ShowTime
    @Published var showSeatsMap: Bool = false
    @Published var hall: Hall = .init()
    @Published var showBottomCard: Bool = false
    @Published var showBoughtTicket: Bool = false
    
    var movie: MovieViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(movie: MovieViewModel) {
        let temp = ShowTimeProvider.allShows.first == nil ? ShowTime(hour: 11, minutes: 0) : ShowTimeProvider.allShows.first!
        
        selectedTime = temp
        self.movie = movie
        addSubscripers()
    }
    
    func addSubscripers() {
        hall.$showBottomCard
            .sink { [weak self] recived in
                self?.showBottomCard = recived
            }
            .store(in: &cancellables)
    }
    
    
    
    func generateBarcode() -> UIImage {
        let barCodeData = "\(selectedDate.longDate), \(selectedTime.label), seats:\(hall.selectedSeatsNumbers)"
        
        
        return BarcodeGenerator.generateBarCode(from: barCodeData, descriptor: .code128)
    }
    
    func buy() {
        showBoughtTicket = true
    }
    
}
