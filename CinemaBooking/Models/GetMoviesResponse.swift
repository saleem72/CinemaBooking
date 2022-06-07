//
//  GetMoviesResponse.swift
//  PlaygroundForTesting
//
//  Created by Yousef on 8/15/21.
//

import SwiftUI
/*
 {
     "id": 338953,
     "title": "Fantastic Beasts",
     "subtitle": "The Secrets of Dumbledore",
     "overview": "Professor Albus Dumbledore knows the powerful, dark wizard Gellert Grindelwald is moving to seize control of the wizarding world. Unable to stop him alone, he entrusts magizoologist Newt Scamander to lead an intrepid team of wizards and witches. They soon encounter an array of old and new beasts as they clash with Grindelwald\'s growing legion of followers.",
     "releaseDate": "2022-04-06",
     "posterPathHighResURLString": "https://image.tmdb.org/t/p/w500/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg",
     "posterPathLowResURLString": "https://image.tmdb.org/t/p/w200/jrgifaYeUtTnaH7NF5Drkgjg2MB.jpg",
     "popularity": 9941.754,
     "voteAverage": 6.8,
     "voteCount": 1497,
     "backdropPath": "https://image.tmdb.org/t/p/w500/7ucaMpXAmlIM24qZZ8uI9hCY0hm.jpg"
 }
 */

struct MoviesResponse: Codable {
    let playNow: [MovieViewModel]
    let comingSoon: [MovieViewModel]
    let topMovies: [MovieViewModel]
    
    enum CodingKeys: String, CodingKey {
        case playNow = "play_now"
        case comingSoon = "coming_soon"
        case topMovies = "top_movies"
    }
}

struct MovieViewModel: Identifiable, Codable, Hashable {
    
    let id: Int
    let title: String?
    let subtitle: String?
    let overview: String?
    let releaseDate: String?
    let posterPathHighResURLString: String?
    let posterPathLowResURLString: String?
    let popularity: Double?
    let voteAverage: Double?
    let voteCount: Int?
    let backdropPath: String?
    
    var imageLowResURL: URL? {
        return URL(string: posterPathLowResURLString ?? "")
    }
    
    var imageHighResURL: URL? {
        return URL(string: posterPathHighResURLString ?? "")
    }
    
    var backdropPathURL: URL? {
        return URL(string: backdropPath ?? "")
    }
    
    
    static var example: MovieViewModel = .init(
        id: 453395,
        title: "Doctor Strange",
        subtitle: "in the Multiverse of Madness",
        overview: "Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.",
        releaseDate: "2022-05-04",
        posterPathHighResURLString: "https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
        posterPathLowResURLString: "https://image.tmdb.org/t/p/w200/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg",
        popularity: 3348.339,
        voteAverage: 7.4,
        voteCount: 2140,
        backdropPath: "https://image.tmdb.org/t/p/w500/gUNRlH66yNDH3NQblYMIwgZXJ2u.jpg"
    )
}
