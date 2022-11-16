//
//  CardMovieCell.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class CardMovie:UIView{
    
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
        
    }
    
    private func addMoviePicture(){
        self.containerView.addSubview(moviePictureImageView)
    }
    
    private func addMovieTitleLabel(){
        self.containerView.addSubview(movieTitleLabel)
    }
    
    private func addStackContainer(){
        self.containerView.addSubview(stackView)
    }
    
    private func addMovieDateLabel(){
        self.stackView.addArrangedSubview(movieDateLabel)
    }
    
    private func addMovieRatingLabel(){
        self.stackView.addArrangedSubview(movieRatingLabel)
    }
    
    private func addMovieDescriptionLabel(){
        self.containerView.addSubview(movieDescriptionLabel)
    }
}
