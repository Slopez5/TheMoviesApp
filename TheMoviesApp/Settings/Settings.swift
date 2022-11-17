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
    var isLogged:Bool = true
    var primaryColor:UIColor?
    var secondaryColor:UIColor?
    var apiURL:String?
    var imagesUrl:String?
    var apiKey:String?
    var fontSize:CGFloat = 16
    var fontFamily:UIFont?
    
    init(){
        guard let brandingPlist = getBrandingPlist() else { return }
        if let colorHex = brandingPlist["primaryColor"] as? String {
            self.primaryColor = UIColor(hex: colorHex)
        }
        if let colorHex = brandingPlist["secondaryColor"] as? String {
            self.secondaryColor = UIColor(hex: colorHex)
        }
        self.imagesUrl = brandingPlist["imagePath"] as? String ?? ""
        self.apiURL = (brandingPlist["APIUrl"] as? String ?? "") + (brandingPlist["versionAPI"] as? String ?? "")
        self.apiKey = brandingPlist["apiKey"] as? String
        
    }
    
    func getBrandingPlist() -> NSDictionary?{
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"), let nsDictionary = NSDictionary(contentsOfFile: path) {
            return nsDictionary
        }
        return nil
    }
}
