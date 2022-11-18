//
//  MovieDetailsView.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation
import UIKit

class MovieDetailsView:UIViewController {
    lazy var moviePictureImageView: UIImageView = {
        let image:UIImageView = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var movieTitleText:Text = {
        let movieTitle:Text = Text(type: .title)
        return movieTitle
    }()
    
    lazy var movieVoteText: Text = {
        let movieVote:Text = Text(type: .message)
        return movieVote
    }()
    
    lazy var movieDateText: Text = {
        let movieDate:Text = Text(type: .message)
        return movieDate
    }()
    
    lazy var movieDescriptionText: Text = {
        let movieDescription:Text = Text(type: .message)
        movieDescription.numberOfLines = 0
        return movieDescription
    }()
    
    lazy var movieLangaugeAvailableTitleText: Text = {
        let movieLanguagesAvailableTitle:Text = Text(type: .message)
        return movieLanguagesAvailableTitle
    }()
    
    lazy var movieLangaugesAvailableText: Text = {
        let movieLangaugesAvailable:Text = Text(type: .subtitle)
        return movieLangaugesAvailable
    }()
    
    lazy var movieRateText: Text = {
        let movieRate:Text = Text(type: .message)
        return movieRate
    }()
    
    lazy var movieFavoriteIconImageView: UIImageView = {
        let movieFavoriteIcon:UIImageView = UIImageView()
        movieFavoriteIcon.translatesAutoresizingMaskIntoConstraints = false
        return movieFavoriteIcon
    }()
    
    var coordinator:MainCoordinator?
    var movieDetailsViewModel:MovieDetailsViewModel = MovieDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = . white
        initView()
        setUpBinds()
    }
    
    func initBranding(movie:MovieDetail){
        let baseUrl = Settings.shared.imagesUrl ?? ""
        API().getImage(url: baseUrl + movie.backdropPath) { image in
            DispatchQueue.main.async {
                self.moviePictureImageView.image = image
            }
        }
        movieTitleText.text = movie.originalTitle
        movieVoteText.text = "VOTES_LBL_TAG".getString() + " " + movie.voteCount.description
        movieRateText.text = movie.voteAverage.description
        movieDateText.text = movie.releaseDate
        movieDescriptionText.text = movie.overview
        if let languages = movie.spokenLanguages {
            var languagesAvailable:[String] = []
            for language in languages {
                languagesAvailable.append( (language.name))
            }
            movieLangaugesAvailableText.text = languagesAvailable.joined(separator: ", ")
        }
        movieLangaugeAvailableTitleText.text = "LANGUAGES_AVAILABLES_LBL_TAG".getString()
        
    }
    
    func setUpBinds(){
        movieDetailsViewModel.movieDetails.bind { [weak self] movie in
            DispatchQueue.main.async {
                if let movie = movie {
                    self?.initBranding(movie: movie)
                }
            }
        }
    }
    
    func initView(){
        addMoviePicture()
        addMovieTitle()
        addMovieVotes()
        addMovieDate()
        addMovieDescription()
        addMovieLanguageAvailableTitle()
        addMovieLanguagesAvailable()
        addMovieRate()
        addMovieFavoriteIcon()
    }
    
    func addMoviePicture() {
        self.view.addSubview(moviePictureImageView)
        
        NSLayoutConstraint.activate([
            moviePictureImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            moviePictureImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            moviePictureImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            moviePictureImageView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    func addMovieTitle() {
        self.view.addSubview(movieTitleText)
        
        NSLayoutConstraint.activate([
            movieTitleText.topAnchor.constraint(equalTo: self.moviePictureImageView.bottomAnchor),
            movieTitleText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieTitleText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieVotes() {
        self.view.addSubview(movieVoteText)
        
        NSLayoutConstraint.activate([
            movieVoteText.topAnchor.constraint(equalTo: self.movieTitleText.bottomAnchor),
            movieVoteText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieVoteText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieDate() {
        self.view.addSubview(movieDateText)
        
        NSLayoutConstraint.activate([
            movieDateText.topAnchor.constraint(equalTo: self.movieVoteText.bottomAnchor),
            movieDateText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieDateText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieDescription() {
        self.view.addSubview(movieDescriptionText)
        
        NSLayoutConstraint.activate([
            movieDescriptionText.topAnchor.constraint(equalTo: self.movieDateText.bottomAnchor),
            movieDescriptionText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieDescriptionText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieLanguageAvailableTitle() {
        self.view.addSubview(movieLangaugeAvailableTitleText)
        
        NSLayoutConstraint.activate([
            movieLangaugeAvailableTitleText.topAnchor.constraint(equalTo: self.movieDescriptionText.bottomAnchor),
            movieLangaugeAvailableTitleText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieLangaugeAvailableTitleText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieLanguagesAvailable() {
        self.view.addSubview(movieLangaugesAvailableText)
        
        NSLayoutConstraint.activate([
            movieLangaugesAvailableText.topAnchor.constraint(equalTo: self.movieLangaugeAvailableTitleText.bottomAnchor),
            movieLangaugesAvailableText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieLangaugesAvailableText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieRate() {
        self.view.addSubview(movieRateText)
        
        NSLayoutConstraint.activate([
            movieRateText.topAnchor.constraint(equalTo: self.movieLangaugesAvailableText.bottomAnchor),
            movieRateText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieRateText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    func addMovieFavoriteIcon() {
        self.view.addSubview(movieFavoriteIconImageView)
        
        NSLayoutConstraint.activate([
            movieFavoriteIconImageView.topAnchor.constraint(equalTo: self.movieRateText.bottomAnchor),
            movieFavoriteIconImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            movieFavoriteIconImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            movieFavoriteIconImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: -20),
        ])
    }
}
