//
//  HomeScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var searchTerm: String = ""
    
    @State private var movies: [String] = ["aquaman", "avatar", "blackPanther", "morbius", "sonic", "strange"]
    
    @State private var showReservation: Bool = false
    
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
            AppTextField(searchTerm: $searchTerm)
            moviesSections
        }
        .foregroundColor(Color.white.opacity(0.87))
        .background(navList)
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
                
                moviesList
                
                Text("Coming Soon")
                    .customFont(.headline)
                    .foregroundColor(.white)
                moviesList
                
                Text("Top movies")
                    .customFont(.headline)
                    .foregroundColor(.white)
                moviesList
                
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
    
    private var moviesList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(movies, id:\.self) { movie in
                    Image(movie)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 130)
                        .cornerRadius(20)
                        .onTapGesture {
                            showReservation = true
                        }
                }
            }
        }
    }
    
    private var navList: some View {
        VStack {
            NavigationLink(
                "",
                destination: ReservationScreen(),
                isActive: $showReservation
            )
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppTextField: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        TextField("", text: $searchTerm)
            .customFont(.headline)
            .padding(.horizontal, 32)
            .overlay(
                Image(systemName: "magnifyingglass"), alignment: .leading
            )
            .overlay(
                Image(systemName: "mic.fill"), alignment: .trailing
            )
            .background(placeHolder(), alignment: .leading)
            .frame(height: 36)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: "767680").opacity(0.12))
            )
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private func placeHolder() -> some View {
        if searchTerm.isEmpty {
            Text("Search")
                .padding(.leading, 32)
                .allowsTightening(false)
        }
    }
}
