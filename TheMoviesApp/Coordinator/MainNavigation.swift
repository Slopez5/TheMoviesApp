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
    
    func start() {
        if Settings.shared.isLogged {
            home(animated: false)
        } else {
            login(animated: false)
        }
    }
    
    func login(animated:Bool){
        let loginVC = LoginView()
        loginVC.coordinator = self
        navigationController.pushViewController(loginVC, animated: animated)
    }
    
    func home(animated:Bool){
        
    }
    
    func movieDetails(animated:Bool){
        
    }
}
