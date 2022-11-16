//
//  MoviesDataSource.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class MoviesDataSource:NSObject, UICollectionViewDataSource {
    
    private var movies:[MovieDetail] = []
    
    func loadMovies(movies:[MovieDetail]){
        self.movies = movies
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCells.MovieCell, for: indexPath) as! MovieCollectionCell
        cell.initView()
        cell.setData(movie:movies[indexPath.row])
        return cell
    }
}
