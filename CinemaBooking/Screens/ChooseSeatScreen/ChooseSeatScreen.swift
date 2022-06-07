//
//  ChooseSeatScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/1/22.
//

import SwiftUI

struct ChooseSeatScreen: View {
    @EnvironmentObject private var session: SessionManager
    @ObservedObject private var viewModel: ReservationViewModel
    
    @Environment(\.presentationMode) private var presentationMode
    
    init(viewModel: ReservationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            backgroundLayer
            content
            possibleBottomCard()
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.hall.getData()
        }
    }
}

extension ChooseSeatScreen {
    
    @ViewBuilder
    private func possibleBottomCard() -> some View {
        if viewModel.showBottomCard {
            bottomCard
        }
    }
    
    private var content: some View {
        VStack {
            
            header
            
            ScreenView()
                .padding(.top, 53)
                .padding(.bottom, 60)
            
            FirstHallView(hall: viewModel.hall)
            
            Spacer(minLength: 0)
        }
        .background(navList)
    }
    
    private var header: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.backward")
                    .headerButton()
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(Asset.menu)
                    .headerButton()
            })
        }
        .overlay(
            Text("Choose Seats")
                .customFont(.title3)
                .foregroundColor(.white)
        )
        .padding()
    }
    
    private var bottomCard: some View {
        VStack {
            
            Spacer()
            TicketDetailsView(viewModel: viewModel) {
                viewModel.buy()
            }
            
        }
        .transition(.move(edge: .bottom))
        .customFont()
    }
    
    private var backgroundLayer: some View {
        Color(hex: "2C135C")
            .edgesIgnoringSafeArea(.all)
    }
    
    private var navList: some View {
        VStack {
            NavigationLink(
                "",
                destination: MobileTicketsScreen(viewModel: viewModel),
                isActive: $viewModel.showBoughtTicket
            )
        }
    }
}

struct ChooseSeatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSeatScreen(viewModel: ReservationViewModel.init(movie: .example))
            .environmentObject(SessionManager())
    }
}
