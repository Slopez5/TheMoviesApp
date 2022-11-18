//
//  MovieDetailsViewModel.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation

class MovieDetailsViewModel {
    let movieDetails:ObservableObject<MovieDetail?> = ObservableObject(nil)
    
    func movieDetails(movieId:Int) {
        MovieAPI().movieDetails(movieId: movieId.description) { [weak self] movies in
            DispatchQueue.main.async {
                if let movies = movies {
                    self?.movieDetails.value = movies
                }
            }
        }
    }
}
