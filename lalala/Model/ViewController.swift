//
//  ViewController.swift
//  lalala
//
//  Created by adyl CEO on 25/05/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var characters: [Character] = []
    var tableview = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        setupTableView()
        getCharacter()
    }
    
    func setupTableView() {
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func getCharacter() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(CharacterResult.self, from: data)
                
                self.characters = result.results
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch {
                print("Ошибка \(error)")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        if let url = URL(string: character.image) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(data: data)
                        cell.setNeedsLayout()
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = CharacterDetailViewController()
        detailVC.character = characters[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
