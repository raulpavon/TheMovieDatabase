//
//  MovieCoordinator.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 07/12/21.
//

import Foundation
import UIKit

class MovieCoordinator {
    var navigationController: UINavigationController
    private let factory =  MovieFactoryImp()

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieListViewController = factory.makeMovieListViewController(movieCoordinator: self)
        navigationController.setViewControllers([movieListViewController], animated: false)
    }
    
    func openMovieDetail(movie: Movie) {
        let pokedexDetailViewController = factory.makeMovieDeatailViewController(movieCoordinator: self, movie: movie)
        navigationController.pushViewController(pokedexDetailViewController, animated: true)
    }
}
