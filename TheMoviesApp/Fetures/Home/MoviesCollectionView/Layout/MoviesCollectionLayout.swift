//
//  MoviesCollectionLayout.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class MoviesCollectionLayout:UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        self.itemSize = CGSize(width: 160, height: 100)
        self.scrollDirection = .vertical
    }
}
