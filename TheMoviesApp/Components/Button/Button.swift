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
    private var buttonStyle:ButtonStyle = .normal
    
    init(style:ButtonStyle) {
        super.init(frame: .zero)
        self.buttonStyle = style
        setBranding()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setBranding(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 20
        switch (buttonStyle) {
        case .cancel:
            self.backgroundColor = .gray
        case .normal:
            self.backgroundColor = Settings.shared.secondaryColor
        }
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
