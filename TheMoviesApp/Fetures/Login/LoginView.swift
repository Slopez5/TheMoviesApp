//
//  LoginView.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 15/11/22.
//

import Foundation
import UIKit

class LoginView:UIViewController {
    lazy var logoImageView: UIImageView = {
        let logo:UIImageView = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        return logo
    }()
    
    lazy var emailInput: Input = {
        let email:Input = Input(type: .email)
        email.placeholder = "EMAIL_LBL_TAG".getString()
        return email
    }()
    
    lazy var passwordInput: Input = {
        let password:Input = Input(type: .password)
        password.placeholder = "password".getString()
        return password
    }()
    
    lazy var loginButton: Button = {
        let login:Button = Button(style: .normal)
        return login
    }()
    
    var coordinator:MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    func initView(){
        self.view.backgroundColor = Settings.shared.primaryColor
        addLogo()
        addEmailInput()
        addPasswordInput()
    }
    
    private func addLogo(){
        self.view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            logoImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30)
        ])
    }
    
    private func addEmailInput(){
        self.view.addSubview(emailInput)
    }
    
    private func addPasswordInput(){
        self.view.addSubview(passwordInput)
    }
}
