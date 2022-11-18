//
//  Globals.swift
//  TheMoviesApp
//
//  Created by Developer on 18/11/22.
//

import Foundation

class Globals {
    static let shared = Globals()
    var user:User?
    let defaults = UserDefaults.standard
    
    func saveUser(user:User){
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(user) {
            defaults.set(data, forKey: "USER")
            defaults.synchronize()
        }
        self.user = user
    }
    
    func getUser() -> User?{
        let decoder = JSONDecoder()
        
        if let data = defaults.object(forKey: "USER") as? Data, let user = try? decoder.decode(User.self, from: data) {
            self.user = user
            return user
        }
        return nil
    }
}
