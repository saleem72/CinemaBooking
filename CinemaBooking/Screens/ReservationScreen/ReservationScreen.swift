//
//  ReservationScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 5/30/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReservationScreen: View {
    @EnvironmentObject private var session: SessionManager
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel: ReservationViewModel
    
    init(movie: MovieViewModel) {
        self._viewModel = StateObject(wrappedValue: ReservationViewModel.init(movie: movie))
    }
    
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
        WebImage(url: viewModel.movie.imageHighResURL)
            .resizable()
            .placeholder {
                Image(Asset.man)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
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
                Text(viewModel.movie.title ?? "")
                    .customFont(.title3)
                Text(viewModel.movie.subtitle ?? "")
                    .customFont()
            }
            
            Text(viewModel.movie.overview ?? "")
                .customFont()
                .padding(.top, 30)
                .lineLimit(4)
            
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
        ReservationScreen(movie: .example)
            .environmentObject(SessionManager())
    }
}


