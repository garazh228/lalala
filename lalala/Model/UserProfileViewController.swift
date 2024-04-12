//
//  UserProfileViewController.swift
//  lalala
//
//  Created by adyl CEO on 29/03/2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let nameLabel = UILabel()
    let surnameLabel = UILabel()
    let phoneLabel = UILabel()

    
    var sessionManager: UserSessionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        view.backgroundColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        surnameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(surnameLabel)
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            surnameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneLabel.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 20)
        ])
        
        nameLabel.text = sessionManager.name
        surnameLabel.text = sessionManager.surname
        phoneLabel.text = sessionManager.phone
    }
}
