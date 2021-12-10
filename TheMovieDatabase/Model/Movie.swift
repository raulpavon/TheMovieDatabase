//
//  Movie.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 08/12/21.
//

import Foundation

struct Movie: Codable {
    let posterPath: String
    let title: String
    let releaseDate: String
    let overview: String
    let raiting: Double
    
    init(posterPath: String, title: String, releaseDate: String, overview: String, raiting: Double) {
        self.posterPath = posterPath
        self.title = title
        self.releaseDate = releaseDate
        self.overview = overview
        self.raiting = raiting
    }
    
    init() {
        self.posterPath = ""
        self.title = ""
        self.releaseDate = ""
        self.overview = ""
        self.raiting = 0.0
    }
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case title
        case releaseDate = "release_date"
        case overview
        case raiting = "vote_average"
    }
}
