//
//  MoviesList.swift
//  CinemaBooking
//
//  Created by Yousef on 6/7/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviesList: View {
    
    let movies: [ MovieViewModel]
    let onTap: (MovieViewModel) -> Void
    
    init(movies: [MovieViewModel], onTap: @escaping (MovieViewModel) -> Void) {
        self.movies = movies
        self.onTap = onTap
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(movies) { movie in
                    WebImage(url: movie.imageHighResURL)
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 130)
                        .cornerRadius(20)
                        .onTapGesture {
                            onTap(movie)
                        }
                }
            }
        }
    }
}
