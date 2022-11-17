//
//  MovieCollectionCell.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class MovieCollectionCell:UICollectionViewCell {
    var movieCardView:CardMovieView = CardMovieView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        self.addSubview(movieCardView)
        
        NSLayoutConstraint.activate([
            movieCardView.topAnchor.constraint(equalTo: self.topAnchor),
            movieCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            movieCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            movieCardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setData(movie:MovieDetail) {
        movieCardView.drawMovie(movie:movie)
        
    }
}
