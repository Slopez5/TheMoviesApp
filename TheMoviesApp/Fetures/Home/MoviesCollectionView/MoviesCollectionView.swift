//
//  MoviesCollectionView.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class MoviesCollectionView:UICollectionView{
    let moviesDataSource:MoviesDataSource = MoviesDataSource()
    
    init(){
        super.init(frame: .zero, collectionViewLayout: MoviesCollectionLayout())
        register(MovieCollectionCell.self, forCellWithReuseIdentifier: CollectionViewCells.MovieCell)
        dataSource = moviesDataSource
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func reloadMovies(movies:[MovieDetail]){
        moviesDataSource.loadMovies(movies: movies)
        self.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
