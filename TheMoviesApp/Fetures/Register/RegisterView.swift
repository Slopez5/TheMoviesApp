//
//  RegisterView.swift
//  TheMoviesApp
//
//  Created by Developer on 16/11/22.
//

import Foundation
import UIKit

class RegisterView:UIViewController{
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
    
    lazy var registerButton: Button = {
        let register:Button = Button(style: .normal)
        register.setTitle("SIGN_UP_LBL_TAG".getString(), for: .normal)
        return register
    }()
    
    lazy var loginLabel: Text = {
        let login:Text = Text(type: .link)
        login.text = "LOGIN_LBL_TAG".getString()
        login.textAlignment  = .center
        return login
    }()
    
    var coordinator:MainCoordinator?
    var registerViewModel:RegisterViewModel = RegisterViewModel()
    
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
        addRegisterButton()
        addLoginText()
    }
    
    func initActions(){
        registerButton.addTarget(self, action: #selector(registerAction(_:)), for: .touchUpInside)
        loginLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginAction(_:))))
    }
    
    func setUpBinds(){
        registerViewModel.auth.bind { [weak self] authenticate in
            if let authenticate = authenticate, authenticate {
                self?.coordinator?.back(animated: true)
            }
        }
    }
    
    @objc func loginAction(_ sender:Text){
        coordinator?.back(animated:true)
    }
    
    @objc func registerAction(_ sender:UIButton){
        let email = emailInput.text ?? ""
        let password = passwordInput.text ?? ""
        
        registerViewModel.register(email: email, password: password)
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
    
    private func addRegisterButton(){
        self.view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
    private func addLoginText(){
        self.view.addSubview(loginLabel)
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            loginLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
}
