//
//  MovieProtocols.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 08/12/21.
//

import Foundation

protocol MovieView: AnyObject {
    func setMovie(movie: [Movie])
    func goToMovieDetail(movie: Movie)
}

protocol MovieViewModel {
    func getMovieList()
    func saveMovies(movies: [Movie])
}
