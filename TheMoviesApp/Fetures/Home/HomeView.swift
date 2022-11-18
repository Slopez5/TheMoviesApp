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
        let sections:UISegmentedControl = UISegmentedControl(items: ["POPULARES_LBL_TAG".getString(),"TOP_RATE_LBL_TAG".getString(),"FAVORITES".getString()])
        sections.selectedSegmentIndex = 0
        sections.translatesAutoresizingMaskIntoConstraints = false
        return sections
    }()
    
    lazy var moviesCollectionView: MoviesCollectionView = {
        let movies:MoviesCollectionView = MoviesCollectionView()
        return movies
    }()
    
    var coordinator:MainCoordinator?
    var homeViewModel:HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        addActions()
        setUpBinds()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    func addActions(){
        sectionsSegmentControl.addTarget(self, action: #selector(changeCategory(_:)), for: .valueChanged)
    }
    
    func initView(){
        self.view.backgroundColor = .white
        addSectionsSegments()
        addMoviesCollection()
        homeViewModel.getMovies(index: sectionsSegmentControl.selectedSegmentIndex)
    }
    
    func setUpBinds(){
        homeViewModel.movies.bind { movies in
            DispatchQueue.main.async {
                if let movies = movies, !movies.results.isEmpty {
                    self.moviesCollectionView.reloadMovies(movies: movies.results)
                } else {
                    self.moviesCollectionView.reloadMovies(movies: [])
                }
            }
        }
    }
    
    @objc func changeCategory(_ sender:Any){
        homeViewModel.getMovies(index: sectionsSegmentControl.selectedSegmentIndex)
    }
    
    private func addSectionsSegments(){
        self.view.addSubview(sectionsSegmentControl)
        NSLayoutConstraint.activate([
            sectionsSegmentControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
            sectionsSegmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sectionsSegmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            sectionsSegmentControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func addMoviesCollection(){
        self.view.addSubview(moviesCollectionView)
        moviesCollectionView.delegate = self
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: self.sectionsSegmentControl.bottomAnchor),
            moviesCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            moviesCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            moviesCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = moviesCollectionView.cellForItem(at: indexPath) as! MovieCollectionCell
        guard let movieSelected = cell.movieSelected else { return }
        coordinator?.movieDetails(movie: movieSelected, animated: true)
    }
}
