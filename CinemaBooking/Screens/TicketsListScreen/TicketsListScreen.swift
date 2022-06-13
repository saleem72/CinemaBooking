//
//  TicketsListScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/7/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct Ticket: Identifiable, Codable {
    let id: Int
    let movie: MovieViewModel
    let selectedDate: Date
    let selectedTime: ShowTime
    let selectedSeats: [Seat]
    
    var selectedSeatsNumbers: String {
        selectedSeats.map({String($0.number)}).joined(separator: ", ")
    }
    
    static var example: Ticket = Ticket(
        id: 1,
        movie: MovieViewModel.example,
        selectedDate: Date(),
        selectedTime: ShowTime.example,
        selectedSeats: Seat.dummyData
    )
}

final class TicketsProvider {
    func getTickets() -> [Ticket] {
        let result = Bundle.main.ObjectFromJson(type: [Ticket].self, fileName: "Tickets.json")
        
        switch result {
        case .success(let array):
            return array
        case .failure(let error):
            print("🔥 Error: \(error.localizedDescription)")
            return []
        }
    }
}

final class TicketsListViewModel: ObservableObject {
    @Published private(set) var tickets: [Ticket] = []
    @Published private(set) var selectedIndex: Int = 0
//    @Published private(set) var presentedTickets: [Ticket]  = []
    
    var presentedTickets: [Ticket] {
        Array(tickets.prefix(3)).reversed()
    }
    
    private var provider: TicketsProvider = .init()
    
    func getTickets() {
        self.tickets = provider.getTickets()
    }
    
    func rotationAngle(for index: Int) -> Double {
        if index == 1 {
            return -6.05
        } else if index == 2 {
            return 0
        } else {
            return 6.05
        }
    }
    
    func getOffset(for index: Int) -> CGFloat {
        if index == 1 {
            return -52
        } else if index == 2 {
            return 0
        } else {
            return 52
        }
    }
    
    func shiftTickets() {
        guard let first = tickets.first else { return }
        
        tickets = Array(tickets.dropFirst())
        tickets.append(first)
        selectedIndex += 1
        if selectedIndex > tickets.count - 1 {
            selectedIndex = 0
        }
//        print("tickets: \((tickets.compactMap({$0.movie.title})).joined(separator: ", "))")
//        print("presentedTickets: \((presentedTickets.compactMap({$0.movie.title})).joined(separator: ", "))")
    }
}

struct TicketsListScreen: View {
    @EnvironmentObject private var session: SessionManager
    @StateObject private var viewModel: TicketsListViewModel = .init()
    
    
    
    var body: some View {
        ZStack {
            backgroundLayer
            
            VStack {
                descriptionMessage
                    .padding(.vertical, 30)
                
                if !viewModel.tickets.isEmpty {
                    VStack(spacing: 30) {
                        ZStack {
                            ForEach(viewModel.presentedTickets.indices) { idx in
                                TicketCard(ticket: viewModel.presentedTickets[idx], coloredBorder: idx == viewModel.presentedTickets.count - 1) {
                                    viewModel.shiftTickets()
                                }
                                .rotationEffect(Angle(degrees: viewModel.rotationAngle(for: idx)))
                                .offset(x: viewModel.getOffset(for: idx))
                                    
                            }
                        }
                        
                        HStack {
                            ForEach(0..<viewModel.tickets.count, id:\.self) { idx in
                                Circle()
                                    .fill(viewModel.selectedIndex == idx ? Color(hex: "7C62D6") : Color.white.opacity(0.2))
                                    .frame(width: viewModel.selectedIndex == idx ? 8: 6, height: viewModel.selectedIndex == idx ? 8: 6)
                            }
                        }
                    }
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: viewModel.getTickets)
    }
}

extension TicketsListScreen {
    
    
    
    private var descriptionMessage: some View {
        Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.")
            .customFont()
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 64)
    }
    
    private var header: some View {
        HStack {
            Button(action: {
                session.goBackHome()
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
            Text("Mobile Ticket")
                .customFont(.title3)
                .foregroundColor(.white)
        )
        .padding()
    }
    
    private var backgroundLayer: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.theme.blue,
                Color.theme.background
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
            ZStack {
                Circle()
                    .fill(Color(hex: "FF53C0").opacity(0.4))
                    .frame(width: 300, height: 300)
                    .offset(x: UIScreen.main.bounds.width * 0.5 - 75, y: 0)
                    .blur(radius: 100)
                
                Circle()
                    .fill(Color(hex: "60FFCA").opacity(0.4))
                    .frame(width: 300, height: 300)
                    .offset(x: 0, y: -150)
                    .blur(radius: 100)
            }
        )
    }
}

struct TicketsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TicketsListScreen()
            .environmentObject(SessionManager())
    }
}





