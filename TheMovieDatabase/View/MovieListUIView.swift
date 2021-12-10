//
//  MovieListUIView.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 07/12/21.
//

import UIKit

protocol MovieListUIViewDelegate: AnyObject {
    func getMovieDetails(movie: Movie)
}

class MovieListUIView: UIView {
    
    weak var delegate: MovieListUIViewDelegate?
    var movies: [Movie] = []
    
    enum MovieListUIViewConstraints {
        
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let collectionViewMovies: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 145, height: 200)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
        setUp()
    }
    
    func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(collectionViewMovies)
        //addSubview(collectionViewMovies)
    }
    
    private func setUp() {
        collectionViewMovies.delegate = self
        collectionViewMovies.dataSource = self
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionViewMovies.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            collectionViewMovies.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            collectionViewMovies.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            collectionViewMovies.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
        ])
    }
    
    func loadMovies(movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.collectionViewMovies.reloadData()
        }
    }
}

extension MovieListUIView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell
        cell?.fillMovieInfo(movie: movies[indexPath.item])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.getMovieDetails(movie: movies[indexPath.item])
    }
}
