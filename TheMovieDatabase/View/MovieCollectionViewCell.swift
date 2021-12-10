//
//  MovieCollectionViewCell.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 07/12/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    enum MovieCollectionViewCellConstraints {
        
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private lazy var mainContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.layer.cornerRadius = 25.0
        view.layer.shadowOffset = CGSize(width: 0.0, height: 8.0)
        view.layer.shadowRadius = 10.0
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25.0
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    internal lazy var lbMovieName: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    private let imgMovie: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 25.0
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initComponents()
    }

    func initComponents() {
        addComponents()
        setAutolayout()
    }

    func addComponents() {
        addSubview(mainContainer)
        mainContainer.addSubview(imgMovie)
        mainContainer.addSubview(titleContainer)
        titleContainer.addSubview(lbMovieName)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: topAnchor),
            mainContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imgMovie.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            imgMovie.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            imgMovie.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            imgMovie.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor),
            
            titleContainer.bottomAnchor.constraint(equalTo: imgMovie.bottomAnchor),
            titleContainer.heightAnchor.constraint(equalToConstant: 50),
            titleContainer.leadingAnchor.constraint(equalTo: imgMovie.leadingAnchor),
            titleContainer.trailingAnchor.constraint(equalTo: imgMovie.trailingAnchor),
            
            lbMovieName.centerXAnchor.constraint(equalTo: titleContainer.centerXAnchor),
            lbMovieName.centerYAnchor.constraint(equalTo: titleContainer.centerYAnchor)
        ])
    }
    
    func fillMovieInfo(movie: Movie) {
        imgMovie.image = UIImage.getImageFromURL(imageString: movie.posterPath)
        lbMovieName.text = movie.title
    }
}
