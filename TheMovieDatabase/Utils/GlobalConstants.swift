//
//  GlobalConstants.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 06/12/21.
//

import Foundation

struct GlobalConstants {
    enum TheMovieDatabase {
        static let theMovieDatabaseURL = "https://api.themoviedb.org/3/movie/top_rated"
        static let apiKey = "0d7994a757b0db5b35b543bce7921a3a"
        static let httpMethod = "GET"
        static let posterImageURL = "https://image.tmdb.org/t/p/w185"
    }
}
