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
        return container
    }()
    
    lazy var moviePictureImageView:UIImageView = {
        let moviePicture:UIImageView = UIImageView()
        return moviePicture
    }()
    
    lazy var movieTitleLabel: Text = {
        let movieTitle:Text = Text(type: .subtitle)
        return movieTitle
    }()
    
    lazy var stackView: UIStackView = {
        let stack:UIStackView = UIStackView()
        stack.axis = .horizontal
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
        return movieDescription
    }()
    
    
    init(movie:MovieDetail) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
    private func addMoviePicture(){
        self.containerView.addSubview(moviePictureImageView)
        
        NSLayoutConstraint.activate([
            moviePictureImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            moviePictureImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            moviePictureImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            moviePictureImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addMovieTitleLabel(){
        self.containerView.addSubview(movieTitleLabel)
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: moviePictureImageView.bottomAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    private func addStackContainer(){
        self.containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
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
            movieDescriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}
