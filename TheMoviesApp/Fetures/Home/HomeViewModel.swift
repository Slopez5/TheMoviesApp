//
//  HomeViewModel.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation

class HomeViewModel {
    
    var movies:ObservableObject<Movies?> = ObservableObject(nil)
    
    func getMovies(index:Int) {
        switch index {
        case 0:
            popularMovies()
        case 1:
            topRateMovies()
        case 2:
            favoriteMovies()
        default:
            popularMovies()
        }
    }
    
    private func popularMovies(){
        MovieAPI().popularMovies { [weak self] movies in
            self?.movies.value = movies
        }
    }
    
    private func topRateMovies(){
        MovieAPI().topRateMovies { [weak self] movies in
            self?.movies.value = movies
        }
    }
    
    private func favoriteMovies(){
        movies.value = nil
    }
}
