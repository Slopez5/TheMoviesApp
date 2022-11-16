//
//  Settings.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 14/11/22.
//

import Foundation
import UIKit

class Settings {
    static let shared = Settings()
    var isLogged:Bool = false
    var primaryColor:UIColor?
    var apiURL:String?
    var apiKey:String?
    
    init(){
        guard let brandingPlist = getBrandingPlist() else { return }
        if let colorHex = brandingPlist["primaryColor"] as? String {
            self.primaryColor = UIColor(hex: colorHex)
        }
        self.apiURL = (brandingPlist["apiURL"] as? String ?? "") + (brandingPlist["versionAPI"] as? String ?? "")
        self.apiKey = brandingPlist["apiKey"] as? String
        
    }
    
    func getBrandingPlist() -> NSDictionary?{
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"), let nsDictionary = NSDictionary(contentsOfFile: path) {
            return nsDictionary
        }
        return nil
    }
}
