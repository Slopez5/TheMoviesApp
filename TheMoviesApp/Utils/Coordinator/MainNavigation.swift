//
//  MainNavigation.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 14/11/22.
//

import Foundation
import UIKit

class MainCoordinator:Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func back(animated:Bool){
        navigationController.popViewController(animated: animated)
    }
    
    func start() {
        if let user = Globals.shared.user {
            home(user:user, animated: false)
        } else {
            login(animated: false)
        }
    }
    
    func login(animated:Bool){
        let LoginView = LoginView()
        LoginView.coordinator = self
        navigationController.pushViewController(LoginView, animated: animated)
    }
    
    func register(animated:Bool) {
        let registerView = RegisterView()
        registerView.coordinator = self
        navigationController.pushViewController(registerView, animated: animated)
    }
    
    func home(user:User, animated:Bool){
        let homeView = HomeView()
        homeView.coordinator = self
        navigationController.pushViewController(homeView, animated: animated)
    }
    
    func movieDetails(movie:MovieDetail, animated:Bool){
        let movieDetails = MovieDetailsView()
        navigationController.navigationBar.isHidden = false
        movieDetails.coordinator = self
        movieDetails.movieDetailsViewModel.movieDetails(movieId: movie.id)
        navigationController.pushViewController(movieDetails, animated: animated)
    }
}
