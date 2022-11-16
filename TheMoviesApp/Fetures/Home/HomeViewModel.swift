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
        case 1:
            popularMovies()
        case 2:
            topRateMovies()
        case 3:
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
        
    }
    
    private func favoriteMovies(){
        
    }
}
