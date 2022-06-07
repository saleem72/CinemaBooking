//
//  TicketDetailsView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI

struct TicketDetailsView: View {
    
    @ObservedObject private var viewModel: ReservationViewModel
    var onBuy: () -> Void
    init(viewModel: ReservationViewModel, onBuy: @escaping () -> Void) {
        self.viewModel = viewModel
        self.onBuy = onBuy
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ticketDate
            ticketSeats
            ticketPrice
        }
        .customFont(.caption)
        .padding(42)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white.opacity(0.6)
                .blur(radius: 200)
                .background(auroraBk)
                .clipShape(BuyTicketShape())
                .edgesIgnoringSafeArea(.bottom)
        )
        .overlay(buyButton, alignment: .trailing)
        .foregroundColor(Color.white.opacity(0.87))
    }
}


extension TicketDetailsView {
    private var ticketDate: some View {
        HStack(spacing: 10) {
            Image(Asset.calendar)
                .renderingMode(.template)
            
            Text(viewModel.selectedDate.mediumDate)
            
            Circle()
                .fill(Color.white)
                .frame(width: 6, height: 6)
            
            Text(viewModel.selectedTime.label)
                .customFont(.caption)
        }
    }
    
    private var ticketSeats: some View {
        HStack(spacing: 10) {
            Image(Asset.ticket)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 16)
            
            Text(viewModel.hall.selectedSeats.first?.sectionName ?? "") // "VIP Section"
            
            Circle()
                .fill(Color.white)
                .frame(width: 6, height: 6)
            
            Text(viewModel.hall.selectedSeatsNumbers) // "Seat 9 ,10"
        }
    }
    
    private var ticketPrice: some View {
        HStack(spacing: 10) {
            Image(Asset.cart)
                .renderingMode(.template)
            
            Text(viewModel.hall.totalPrice) // "Total: $30"
        }
    }
    
    private var buyButton: some View {
        Button(action: {
            onBuy()
        }, label: {
            Text("Buy")
                .customFont()
                .foregroundColor(.white)
                .frame(width: 70, height: 70)
                .background(Color.white.opacity(0.3).blur(radius: 4))
                
                .mask(Circle())
                .background(
                    Circle()
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.theme.green,
                                    Color.theme.green.opacity(0),
                                    Color.theme.green.opacity(0)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                )
        })
        .offset(y: safeArea.bottom / 2)
        .offset(x: -25)
    }
    
    private var auroraBk: some View {
        ZStack { // FF53C0
            EllipseShape()
                .fill(Color(hex: "3B1578"))
                .frame(width: 200, height: 231)
                .offset(x: -UIScreen.main.bounds.width / 2 + 20, y: 20)
                .blur(radius: 200)
            
            EllipseShape()
                .fill(Color(hex: "5172B3"))
                .frame(width: 200, height: 231)
                .offset(y: 108)
                .blur(radius: 200)
            
            EllipseShape()
                .fill(Color(hex: "FF53C0"))
                .frame(width: 200, height: 231)
                .offset(x: UIScreen.main.bounds.width / 2 - 40, y: 120)
                .blur(radius: 100)
        }
        .edgesIgnoringSafeArea(.bottom)
        .frame(height: 216)
        .frame(maxWidth: .infinity)
    }
}


struct TicketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetailsView(viewModel: ReservationViewModel.init(movie: .example)) { }
    }
}
