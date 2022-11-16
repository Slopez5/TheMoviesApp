//
//  UserAPI.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation
import FirebaseAuth

class UserAPI{
    
    func login(email:String, password:String, _ completion: @escaping(_ authResult:AuthDataResult?, _ error:Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            DispatchQueue.main.async {
                
                completion(authResult,error)
            }
        }
    }
    
    func register(email:String, password:String, _ completion: @escaping(_ authResult:AuthDataResult?, _ error:Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            DispatchQueue.main.async {
                completion(authResult,error)
            }
        }
    }
}
