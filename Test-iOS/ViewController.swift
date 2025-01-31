//
//  ViewController.swift
//  Test-iOS
//
//  Created by Данил Марков on 12.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Constants
    private struct Constants {
        static let helloLabelText = "Добро пожаловать!"
        static let signOrLoginLabelText = "Login or Sign Up"
        
        static let signUpButtonText = "Sign Up"
        static let loginButtonText = "Login"
        
        static let buttonBackgroundColor = UIColor.white
        static let buttonBorderColor = UIColor.black
        static let labelColor = UIColor.white
        static let loginTextFont = UIFont.systemFont(ofSize: 25, weight: .bold)
        static let leadTextFont = UIFont.systemFont(ofSize: 35, weight: .bold)
        static let ordinaryTextFont = UIFont.systemFont(ofSize: 20)
        static let buttonRadius: CGFloat = 20
        static let buttonHeight: CGFloat = 50
        static let buttonWidth: CGFloat = 100
        
        static let imageName = "priority-headline-logo-square"
    }
    
    private let helloLabel = UILabel()
    private let signOrLoginLabel = UILabel()
    private let signUpButton = UIButton(type: .system)
    private let loginButton = UIButton(type: .system)
    private let imageView = UIImageView()
    
    private let stackView = UIStackView()
    private let buttonStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGreen")
        setupUI()
    }
    //MARK: - StackView
    private func setupUI() {
        setupHelloLabel()
        setupImageView()
        setupSignOrLoginLabel()
        setupButtons()
        
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 5
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(signUpButton)
        
        stackView.addArrangedSubview(helloLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(signOrLoginLabel)
        stackView.addArrangedSubview(buttonStackView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            loginButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            signUpButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    //MARK: - Private fuctions
    private func setupHelloLabel() {
        helloLabel.text = Constants.helloLabelText
        helloLabel.textColor = Constants.labelColor
        helloLabel.font = Constants.leadTextFont
        helloLabel.textAlignment = .center
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: Constants.imageName)
        imageView.contentMode = .scaleAspectFit
    }
    
    private func setupSignOrLoginLabel() {
        signOrLoginLabel.text = Constants.signOrLoginLabelText
        signOrLoginLabel.textColor = Constants.labelColor
        signOrLoginLabel.textAlignment = .center
        signOrLoginLabel.font = Constants.ordinaryTextFont
    }
    
    private func setupButtons() {
        signUpButton.setTitle(Constants.signUpButtonText, for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = Constants.ordinaryTextFont
        signUpButton.backgroundColor = Constants.buttonBackgroundColor
        signUpButton.layer.borderColor = Constants.buttonBorderColor.cgColor
        signUpButton.layer.borderWidth = 1.0
        signUpButton.layer.cornerRadius = Constants.buttonRadius
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        loginButton.setTitle(Constants.loginButtonText, for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = Constants.loginTextFont
        loginButton.backgroundColor = Constants.buttonBackgroundColor
        loginButton.layer.borderColor = Constants.buttonBorderColor.cgColor
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.cornerRadius = Constants.buttonRadius
    }
    
    @objc private func signUpButtonTapped() {
        print("Sign Up button tapped")
        let signViewController = SignViewController()
        navigationController?.pushViewController(signViewController, animated: true)
    }
}
