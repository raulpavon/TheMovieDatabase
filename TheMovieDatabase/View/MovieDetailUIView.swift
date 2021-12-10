//
//  MovieDetailUIView.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 09/12/21.
//

import UIKit

class MovieDetailUIView: UIView {
    
    enum MovieDetailUIViewConstraints {
    
    }
    
    internal lazy var lbMovieName: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    private let imgMovie: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 25.0
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    internal lazy var lbMovieDescription: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    internal lazy var lbDate: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    internal lazy var lbRaiting: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.bounces = true
        scroll.delaysContentTouches = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let containerView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .white
        container.axis = .vertical
        container.spacing = 0
        container.distribution = .fillProportionally
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
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
    }
    
    func addComponents() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addArrangedSubview(imgMovie)
        containerView.addArrangedSubview(lbMovieName)
        containerView.addArrangedSubview(lbDate)
        containerView.addArrangedSubview(lbRaiting)
        containerView.addArrangedSubview(lbMovieDescription)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            imgMovie.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imgMovie.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    func setMovieDetail(movie: Movie) {
        imgMovie.image = UIImage.getImageFromURL(imageString: movie.posterPath)
        lbMovieName.text = "Título: \(movie.title)"
        lbRaiting.text = "Raiting: \(movie.raiting)"
        lbDate.text = "Fecha: \(movie.releaseDate)"
        lbMovieDescription.text = "Sinopsis: \(movie.overview)"
    }

}
