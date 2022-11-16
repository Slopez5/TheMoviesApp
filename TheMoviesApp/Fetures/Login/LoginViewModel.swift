//
//  LoginViewModel.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation



class LoginViewModel {
    
    let auth:ObservableObject<Bool?> = ObservableObject(nil)
    
    func login(email:String, password:String) {
        UserAPI().login(email: email, password: password) { [weak self] authResult, error in
            if (authResult?.user) != nil{
                self?.auth.value = true
            } else {
                self?.auth.value = false
            }
        }
    }
}
