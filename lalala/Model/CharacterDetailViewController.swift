//
//  CharacterDetailViewController.swift
//  lalala
//
//  Created by adyl CEO on 25/05/2024.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var character: Character?
    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStatusLabel()
        
        view.backgroundColor = .white
    }
    
    func setupStatusLabel() {
        view.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        guard let character = character else {return}
        statusLabel.text = character.status
    }
}
