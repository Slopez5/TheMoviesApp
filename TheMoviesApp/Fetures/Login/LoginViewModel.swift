//
//  LoginViewModel.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation
import FirebaseAuth


class LoginViewModel {
    
    let auth:ObservableObject<Bool?> = ObservableObject(nil)
    
    func login(email:String, password:String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                if let user = authResult?.user{
                    self?.auth.value = true
                } else {
                    self?.auth.value = false
                }
            }
        }
    }
}
