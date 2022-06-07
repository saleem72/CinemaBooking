//
//  MoviesProvider.swift
//  SwiftUISearchExample
//
//  Created by James Rochabrun on 7/21/20.
//

import Foundation
import Combine



enum MoviesProvider {
    
    
    
    
    static func fetchNowPlayingMovies() -> MoviesResponse {
        /*
        let url = (MovieFeed.nowPlaying.urlComponents.url?.absoluteString ?? "")
        isLoading = true
        cancellable = CombineHttpManager.Get(decodingType: GetMoviesResponse.self, errorType: GetMoviesErrorResponse.self, urlString: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.error = AppError(message: error.localizedDescription)
                }
            },
            receiveValue: { [weak self] in
                self?.movies = $0.results.map { MovieViewModel(movie: $0) }
            })
 */
        
        let result = Bundle.main.ObjectFromJson(type: MoviesResponse.self, fileName: "Movies.json")
        
        switch result {
        case .success(let movies):
            return movies
        case .failure(let error):
            print(error.localizedDescription)
            return MoviesResponse(playNow: [], comingSoon: [], topMovies: [])
        }
    }
    
}
