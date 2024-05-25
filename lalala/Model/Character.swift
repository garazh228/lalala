//
//  Character.swift
//  lalala
//
//  Created by adyl CEO on 25/05/2024.
//

import UIKit

struct CharacterResult: Codable {
    let results: [Character]
}
 
struct Character:Codable {
    let name: String
    let status: String
    let image: String
}
