//
//  MovieDetailViewController.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 09/12/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    weak var movieCoordinator: MovieCoordinator?
    private let factory: MovieFactory
    private var movie: Movie
    
    lazy var movieDetailUIView: MovieDetailUIView = {
        let view = MovieDetailUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    required init(factory: MovieFactory, movieCoordinator: MovieCoordinator,movie: Movie) {
        self.factory = factory
        self.movieCoordinator = movieCoordinator
        self.movie = movie
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
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
        initView()
    }
    
    func addComponents() {
        view.addSubview(movieDetailUIView)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            movieDetailUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieDetailUIView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieDetailUIView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieDetailUIView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func initView(){
        movieDetailUIView.setMovieDetail(movie: movie)
    }
}
