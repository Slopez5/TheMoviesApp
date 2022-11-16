//
//  RegisterViewModel.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import FirebaseAuth


class RegisterViewModel {
    
    let auth:ObservableObject<Bool?> = ObservableObject(nil)
    
    func register(email:String, password:String) {
        Auth.auth().createUser(withEmail: email, password: password) {  [weak self] authResult, error in
            DispatchQueue.main.async {
                if error != nil {
                    self?.auth.value = false
                    return
                }
                self?.auth.value = true
            }
        }
    }
}
