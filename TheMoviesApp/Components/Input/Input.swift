//
//  Input.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 16/11/22.
//

import Foundation
import UIKit

enum InputStyle {
    case text
    case email
    case phone
    case password
}

class Input:UITextField {
    private var inputType:InputStyle = .text
    
    init(type:InputStyle){
        super.init(frame: .zero)
        self.inputType = type
        setBranding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBranding(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        switch (inputType) {
        case .email:
            break
        case .password:
            self.isSecureTextEntry = true
            break
        case .text:
            break
        case .phone:
            break
        }
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
