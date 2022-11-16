//
//  Button.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 16/11/22.
//

import Foundation
import UIKit

enum ButtonStyle {
    case cancel
    case normal
}

class Button:UIButton {
    private var buttonStyle:ButtonStyle
    
    init(style:ButtonStyle) {
        
        super.init(type: .system)
        self.buttonStyle = style
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
