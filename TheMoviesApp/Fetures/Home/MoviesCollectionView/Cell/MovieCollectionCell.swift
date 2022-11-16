//
//  MovieCollectionCell.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class MovieCollectionCell:UICollectionViewCell {
    var movieCardView:CardMovieView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(movie:MovieDetail) {
        movieCardView = CardMovieView(movie: movie)
        self.addSubview(movieCardView!)
    }
}
