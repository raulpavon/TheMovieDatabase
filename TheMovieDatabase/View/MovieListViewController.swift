//
//  MovieListViewController.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 08/12/21.
//

import UIKit

class MovieListViewController: UIViewController {
    
    weak var movieCoordinator: MovieCoordinator?
    private let factory: MovieFactory
    
    lazy var movieListUIView: MovieListUIView = {
        let view = MovieListUIView(frame: .zero)
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewModel: MovieViewModel = {
        factory.makeMovieViewModel(view: self, repository: factory.makeMovieRepository())
    }()

    required init(factory: MovieFactory, movieCoordinator: MovieCoordinator) {
        self.factory = factory
        self.movieCoordinator = movieCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieList()
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    func addComponents() {
        view.addSubview(movieListUIView)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            movieListUIView.topAnchor.constraint(equalTo: view.topAnchor),
            movieListUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieListUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieListUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MovieListViewController: MovieView {
    func goToMovieDetail(movie: Movie) {
        movieCoordinator?.openMovieDetail(movie: movie)
    }
    
    func setMovie(movie: [Movie]) {
        movieListUIView.loadMovies(movies: movie)
    }
}

extension MovieListViewController: MovieListUIViewDelegate {
    func getMovieDetails(movie: Movie) {
        goToMovieDetail(movie: movie)
    }
}
