//
//  HomeView.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation
import UIKit

class HomeView:UIViewController {
    
    lazy var sectionsSegmentControl: UISegmentedControl = {
        let sections:UISegmentedControl = UISegmentedControl()
        return sections
    }()
    
    lazy var moviesCollectionView: UICollectionView = {
        let movies:UICollectionView = UICollectionView()
        return movies
    }()
    
    var coordinator:MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initActions()
        setUpBinds()
    }
    
    func initView(){
        
    }
    
    func initActions(){
        
    }
    
    func setUpBinds(){
        
    }
}
