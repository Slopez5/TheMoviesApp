//
//  Text.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

enum TextStyle {
    case link
    case title
    case subtitle
    case message
}

class Text:UILabel {
    var textStyle:TextStyle = .message
    
    init(type:TextStyle) {
        super.init(frame: .zero)
        self.textStyle = type
        setBranding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBranding(){
        self.translatesAutoresizingMaskIntoConstraints = false
        switch textStyle {
        case .link:
            self.font = UIFont.systemFont(ofSize: Settings.shared.fontSize)
            self.textColor = Settings.shared.secondaryColor
            self.isUserInteractionEnabled = true
            break
        case .title:
            self.font = UIFont.systemFont(ofSize: Settings.shared.fontSize + 4)
            break
        case .subtitle:
            self.font = UIFont.systemFont(ofSize: Settings.shared.fontSize + 2)
            break
        case .message:
            self.font = UIFont.systemFont(ofSize: Settings.shared.fontSize)
            break
        }
    }
    
    
}
