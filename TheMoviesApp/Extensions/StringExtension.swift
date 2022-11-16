//
//  StringExtension.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 16/11/22.
//

import Foundation

extension String {
    func getString() -> String{
        
        return NSLocalizedString(self, comment: "").isEmpty ? self : NSLocalizedString(self, comment: "")
    }
}
