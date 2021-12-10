//
//  MovieViewModel.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 08/12/21.
//

import Foundation

class MovieViewModelImp: MovieViewModel {

    weak var view: MovieView?
    let movieRepository: MovieRepository
    private var movies = [Movie]()
    let data = PersistentData()
    
    
    required init(view: MovieView?, movieRepository: MovieRepository) {
        self.view = view
        self.movieRepository = movieRepository
    }
    
    func getMovieList() {
        movieRepository.getTopMovies {
            [weak self] response in
            self?.movies = response
            self?.movies = response.dropLast(10)
            self?.saveMovies(movies: self?.movies ?? [])
            self?.view?.setMovie(movie: self?.movies ?? []) 
        }
    }
    
    func saveMovies(movies: [Movie]) {
        data.saveMovies(movies: movies)
    }
}
