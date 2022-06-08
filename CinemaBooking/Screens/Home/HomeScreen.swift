//
//  HomeScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

final class HomeViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    
    @Published private(set) var nowPlay: [MovieViewModel] = []
    @Published private(set) var comingSoon: [MovieViewModel] = []
    @Published private(set) var topMovies: [MovieViewModel] = []
    
    @Published private(set) var showReservation: Bool = false
    
    
    
    func getMovies() {
        let response = MoviesProvider.fetchNowPlayingMovies()
        self.nowPlay = response.playNow
        self.comingSoon = response.comingSoon
        self.topMovies = response.topMovies
    }
    
    
}

struct HomeScreen: View {
    @EnvironmentObject private var session: SessionManager
    @StateObject private var viewModel: HomeViewModel = .init()
    
    var body: some View {
        ZStack {
            backgroundLayer
            
            content
        }
        .navigationBarHidden(true)
    }
}

extension HomeScreen {
    
    private var content: some View {
        VStack(spacing: 20) {
            header
            AppTextField(searchTerm: $viewModel.searchTerm)
            moviesSections
        }
        .foregroundColor(Color.white.opacity(0.87))
        .background(navList)
        .onAppear(perform: viewModel.getMovies)
    }
    
    private var header: some View {
        HStack {
            Text("Choose Movie")
                .customFont(.title3)
                .padding()
        }
    }
    
    private var moviesSections: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Now Playing")
                    .customFont(.headline)
                    .foregroundColor(.white)
                
                Group{
                    if viewModel.nowPlay.isEmpty {
                        Text("Sorry, There is no movies for this category right now ")
                            .customFont(.title3)
                            .foregroundColor(Color.white.opacity(0.87))
                            .multilineTextAlignment(.center)
                    } else {
                        MoviesList(movies: viewModel.nowPlay) { movie in
                            session.selectedMovie = movie
                        }
                    }
                }
                .frame(height: 162)
                
                Text("Coming Soon")
                    .customFont(.headline)
                    .foregroundColor(.white)
                
                Group{
                    if viewModel.comingSoon.isEmpty {
                        Text("Sorry, There is no movies for this category right now ")
                            .customFont(.title3)
                            .foregroundColor(Color.white.opacity(0.87))
                            .multilineTextAlignment(.center)
                    } else {
                        MoviesList(movies: viewModel.comingSoon) { movie in
                            session.selectedMovie = movie
                        }
                    }
                }
                .frame(height: 162)
                
                Text("Top movies")
                    .customFont(.headline)
                    .foregroundColor(.white)
                
                Group{
                    if viewModel.topMovies.isEmpty {
                        Text("Sorry, There is no movies for this category right now ")
                            .customFont(.title3)
                            .foregroundColor(Color.white.opacity(0.87))
                            .multilineTextAlignment(.center)
                    } else {
                        MoviesList(movies: viewModel.topMovies) { movie in
                            session.selectedMovie = movie
                        }
                    }
                }
                .frame(height: 162)
                
                Spacer()
                    .frame(height: 90)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
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
                    .offset(x: UIScreen.main.bounds.width * 0.5, y: 150)
                    .blur(radius: 100)
                
                Circle()
                    .fill(Color(hex: "60FFCA").opacity(0.4))
                    .frame(width: 300, height: 300)
                    .offset(x: -UIScreen.main.bounds.width * 0.5, y: -150)
                    .blur(radius: 100)
            }
        )
    }
    
    private var navList: some View {
        VStack {
            if let movie = session.selectedMovie {
                NavigationLink(
                    "",
                    destination: ReservationScreen(movie: movie),
                    tag: movie,
                    selection: $session.selectedMovie)
            }
        }
    }
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(SessionManager())
    }
}


