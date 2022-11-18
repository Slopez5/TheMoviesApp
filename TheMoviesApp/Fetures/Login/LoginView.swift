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
        login.setTitle("LOGIN_LBL_TAG".getString(), for: .normal)
        return login
    }()
    
    lazy var registerLabel: Text = {
        let register:Text = Text(type: .link)
        register.text = "SIGN_UP_LBL_TAG".getString()
        register.textAlignment  = .center
        return register
    }()
    
    var coordinator:MainCoordinator?
    var loginViewModel:LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initActions()
        setUpBinds()
    }
    
    func initView(){
        self.view.backgroundColor = Settings.shared.primaryColor
        addLogo()
        addEmailInput()
        addPasswordInput()
        addLoginButton()
        addRegisterText()
    }
    
    func initActions(){
        loginButton.addTarget(self, action: #selector(loginAction(_:)), for: .touchUpInside)
        registerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerAction(_:))))
    }
    
    func setUpBinds(){
        loginViewModel.auth.bind { [weak self] authenticate in
            if let authenticate = authenticate, authenticate, let user = Globals.shared.user  {
                self?.coordinator?.home(user:user,animated: true)
            }
        }
    }
    
    @objc func loginAction(_ sender:UIButton){
        let email = emailInput.text ?? ""
        let password = passwordInput.text ?? ""
        
        loginViewModel.login(email: email, password: password)
    }
    
    @objc func registerAction(_ sender:Text){
        coordinator?.register(animated: true)
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
        
        NSLayoutConstraint.activate([
            emailInput.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            emailInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            emailInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    private func addPasswordInput(){
        self.view.addSubview(passwordInput)
        
        NSLayoutConstraint.activate([
            passwordInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: 20),
            passwordInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            passwordInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    private func addLoginButton(){
        self.view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    private func addRegisterText(){
        self.view.addSubview(registerLabel)
        
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            registerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            registerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
}
