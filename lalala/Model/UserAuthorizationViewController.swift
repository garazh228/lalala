//
//  UserAuthorizationViewController.swift
//  lalala
//
//  Created by adyl CEO on 29/03/2024.
//

import UIKit

class UserAuthorizationViewController: UIViewController {
    
    let nameTextField = UITextField()
    let surnameTextField = UITextField()
    let authorizeButton = UIButton(type: .system)
    
    var sessionManager: UserSessionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        view.backgroundColor = .white
        
        nameTextField.placeholder = "Name"
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        
        surnameTextField.placeholder = "Surname"
        surnameTextField.borderStyle = .roundedRect
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(surnameTextField)
        
        authorizeButton.setTitle("Далее", for: .normal)
        authorizeButton.addTarget(self, action: #selector(authorizeButtonTapped), for: .touchUpInside)
        authorizeButton.tintColor = .white
        authorizeButton.backgroundColor = .black
        authorizeButton.layer.cornerRadius = 16
        authorizeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorizeButton)
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            surnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            surnameTextField.widthAnchor.constraint(equalToConstant: 300),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            authorizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorizeButton.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 100),
            authorizeButton.widthAnchor.constraint(equalToConstant: 300),
            authorizeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        sessionManager = UserSessionManager()
    }

    @objc func authorizeButtonTapped() {
        guard let name = nameTextField.text, let surname = surnameTextField.text, !name.isEmpty, !surname.isEmpty else {
            showAlert(message: "Пожалуйста, заполните все поля.")
            return
        }
        
        sessionManager.name = name
        sessionManager.surname = surname
        sessionManager.phone = "1234567890"
        sessionManager.sessionCreationDate = Date()

        if sessionManager.isSessionActive() {
            showProfileScreen()
        } else {

        }
    }

    func showProfileScreen() {
        
        let profileViewController = ProfileViewController()
        profileViewController.sessionManager = sessionManager
        
        navigationController?.pushViewController(profileViewController, animated: true)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
