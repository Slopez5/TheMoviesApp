//
//  CardMovieCell.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class CardMovieView:UIView{
    
    lazy var containerView:UIView = {
        let container:UIView = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var moviePictureImageView:UIImageView = {
        let moviePicture:UIImageView = UIImageView()
        moviePicture.translatesAutoresizingMaskIntoConstraints = false
        return moviePicture
    }()
    
    lazy var movieTitleLabel: Text = {
        let movieTitle:Text = Text(type: .subtitle)
        movieTitle.numberOfLines = 1
        return movieTitle
    }()
    
    lazy var stackView: UIStackView = {
        let stack:UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var movieDateLabel:Text = {
        let movieDate:Text = Text(type: .message)
        return movieDate
    }()
    
    lazy var movieRatingLabel:Text = {
        let movieRating:Text = Text(type: .subtitle)
        return movieRating
    }()
    
    lazy var movieDescriptionLabel:Text = {
        let movieDescription:Text = Text(type: .message)
        movieDescription.numberOfLines = 2
        movieDescription.lineBreakMode = .byTruncatingTail
        return movieDescription
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        initView()
        
    }
    
    func drawMovie(movie:MovieDetail){
        setBranding(movie:movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBranding(movie:MovieDetail){
        
        let baseUrl = Settings.shared.imagesUrl ?? ""
        getImage(url: baseUrl + movie.backdropPath)
        movieTitleLabel.text = movie.title
        movieDateLabel.text = movie.releaseDate
        movieRatingLabel.text = movie.voteAverage.description
        movieDescriptionLabel.text = movie.overview
        layoutIfNeeded()
    }
    
    func getImage(url:String){
        API().getImage(url: url) { image in
            DispatchQueue.main.async {
                self.moviePictureImageView.image = image
            }
        }
    }
    
    private func initView(){
        
        addContainerView()
        addMoviePicture()
        addMovieTitleLabel()
        addStackContainer()
        addMovieDescriptionLabel()
    }
    
    private func addContainerView(){
        self.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
    private func addMoviePicture(){
        self.containerView.addSubview(moviePictureImageView)
        
        NSLayoutConstraint.activate([
            moviePictureImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            moviePictureImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            moviePictureImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            moviePictureImageView.heightAnchor.constraint(equalToConstant: 100),
            moviePictureImageView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func addMovieTitleLabel(){
        self.containerView.addSubview(movieTitleLabel)
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: moviePictureImageView.bottomAnchor, constant: 10),
            movieTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    private func addStackContainer(){
        self.containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        addMovieDateLabel()
        addMovieRatingLabel()
    }
    
    private func addMovieDateLabel(){
        self.stackView.addArrangedSubview(movieDateLabel)
    }
    
    private func addMovieRatingLabel(){
        self.stackView.addArrangedSubview(movieRatingLabel)
    }
    
    private func addMovieDescriptionLabel(){
        self.containerView.addSubview(movieDescriptionLabel)
        
        NSLayoutConstraint.activate([
            movieDescriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
}
