//
//  SignViewController.swift
//  Test-iOS
//
//  Created by Данил Марков on 18.11.2024.
//

import UIKit

class SignViewController: UIViewController {
    
    // MARK: - Constants
    private struct Constants {
        static let titleLabelText = "Sign Up"
        static let titleLabelFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        static let textFieldHeight: CGFloat = 50
        static let buttonHeight: CGFloat = 50
        static let buttonCornerRadius: CGFloat = 15
        static let buttonBackgroundColor = UIColor.systemBlue
        static let buttonTitleColor = UIColor.black
        static let textFieldBorderColor = UIColor.black.cgColor
        static let labelTextFieldColor = UIColor.lightGray
        static let buttonTitle = "Register"
        static let spacing: CGFloat = 20
        static let textFieldCornerRadius: CGFloat = 20
        static let textFieldBorderWidth: CGFloat = 2.5
        static let stackSpacing: CGFloat = 10
    }
    
    // MARK: - UI Elements
    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let conteiner = UIView()
    private let registerButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "darkGreen")
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        setupTitleLabel()
        setupTextFields()
        setupRegisterButton()
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, emailTextField, passwordTextField, confirmPasswordTextField, registerButton])
        stackView.axis = .vertical
        stackView.spacing = Constants.spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor.white
        stackView.layer.cornerRadius = 40
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10), // Отступ слева
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10), // Отступ справа
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200), // Отступ сверху
            // Убираем центрирование по вертикали, так как используем topAnchor
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.text = Constants.titleLabelText
        titleLabel.font = Constants.titleLabelFont
        titleLabel.textAlignment = .center
    }
    
    private func setupTextFields() {
        configureTextField(emailTextField, placeholder: "Email")
        configureTextField(passwordTextField, placeholder: "Password", isSecure: true)
        configureTextField(confirmPasswordTextField, placeholder: "Confirm Password", isSecure: true)
    }
    
    private func configureTextField(_ textField: UITextField, placeholder: String, isSecure: Bool = false) {
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecure
        textField.borderStyle = .none
        textField.layer.cornerRadius = Constants.textFieldCornerRadius
        textField.layer.borderWidth = Constants.textFieldBorderWidth
        textField.layer.borderColor = Constants.textFieldBorderColor
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = Constants.textFieldBorderWidth
        textField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight).isActive = true
        
        // Добавляем внутренние отступы для текста (padding)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: Constants.textFieldHeight))
        textField.leftViewMode = .always
    }
    
//    private func setupContainer() {
//        conteiner.backgroundColor = UIColor.white
//        conteiner.layer.cornerRadius = 30
//        сonteiner.masksToBounds = true
//    }
    
    private func setupRegisterButton() {
        registerButton.setTitle(Constants.buttonTitle, for: .normal)
        registerButton.backgroundColor = Constants.buttonBackgroundColor
        registerButton.setTitleColor(Constants.buttonTitleColor, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        registerButton.backgroundColor = UIColor.white
        registerButton.layer.cornerRadius = Constants.buttonCornerRadius
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        registerButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }
    
    // MARK: - Actions
    @objc private func registerButtonTapped() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text,
              !email.isEmpty,
              !password.isEmpty,
              password == confirmPassword else {
            print("Invalid input")
            return
        }
        
        // Save user data (UserDefaults for simplicity)
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        
        // Navigate to Login screen
       // navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
