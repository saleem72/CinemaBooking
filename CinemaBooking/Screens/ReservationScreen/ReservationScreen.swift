//
//  ReservationScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 5/30/22.
//

import SwiftUI
import Combine

class ReservationViewModel: ObservableObject {
    @Published var selectedDate = Date()
    @Published var selectedTime: ShowTime
    @Published var showSeatsMap: Bool = false
    @Published var hall: Hall = .init()
    @Published var showBottomCard: Bool = false
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        let temp = ShowTimeProvider.allShows.first == nil ? ShowTime(hour: 11, minutes: 0) : ShowTimeProvider.allShows.first!
        
        selectedTime = temp
        addSubscripers()
    }
    
    func addSubscripers() {
        hall.$showBottomCard
            .sink { [weak self] recived in
                self?.showBottomCard = recived
            }
            .store(in: &cancellables)
    }
    
}

struct ReservationScreen: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel: ReservationViewModel = .init()
    
    var body: some View {
        ZStack {
            backgroundLayer
            content
        }
        .navigationBarHidden(true)
    }
}

extension ReservationScreen {
    
    private var backgroundLayer: some View {
        ZStack {
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            movieImage
        }
    }
    
    private var movieImage: some View {
        Image(Asset.man)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private var content: some View {
        VStack {
            header

            Spacer()

            card

        }
        .foregroundColor(Color.white.opacity(0.87))
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
        .padding()
    }
    
    private var card: some View {
        VStack {
            movieDetails
                .padding(.top, 45)
            
            
            HorizontalDatePicker(selectedDay: $viewModel.selectedDate, selectedTime: $viewModel.selectedTime)
            
            GradientButton(label: "Reservation") {
                viewModel.showSeatsMap = true
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.theme.gray.opacity(0),
                    Color.theme.background
                ]),
                startPoint: UnitPoint(x: 0.5, y: 0.25),
                endPoint: UnitPoint(x: 0.5, y: 0.55)
            )
            .edgesIgnoringSafeArea(.bottom)
        )
    }
    
    private var movieDetails: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text("Doctor Strange")
                    .customFont(.title3)
                Text("in the Multiverse of Madness")
                    .customFont()
            }
            
            Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of...")
                .customFont()
                .padding(.top, 30)
            
            Text("Select date and time")
                .customFont(.headline)
                .padding(.top, 30)
        }
        .padding(.horizontal, 32)
        .multilineTextAlignment(.center)
    }
    
    private var navList: some View {
        VStack {
            NavigationLink(
                "",
                destination: ChooseSeatScreen(viewModel: viewModel),
                isActive: $viewModel.showSeatsMap
            )
        }
    }
}

struct ReservationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReservationScreen()
    }
}


