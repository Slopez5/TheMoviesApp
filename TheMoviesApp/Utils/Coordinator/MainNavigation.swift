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
        if Settings.shared.isLogged {
            home(animated: false)
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
    
    func home(animated:Bool){
        let homeView = HomeView()
        homeView.coordinator = self
        navigationController.pushViewController(homeView, animated: animated)
    }
    
    func movieDetails(animated:Bool){
        let movieDetails = MovieDetailsView()
        movieDetails.coordinator = self
        navigationController.pushViewController(movieDetails, animated: animated)
    }
}
