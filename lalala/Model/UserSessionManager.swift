//
//  UserSessionManager.swift
//  lalala
//
//  Created by adyl CEO on 29/03/2024.
//

import UIKit

class UserSessionManager {
    var name: String?
    var surname: String?
    var phone: String?
    var sessionCreationDate: Date?

    func isSessionActive() -> Bool {
        return name != nil && surname != nil && phone != nil && sessionCreationDate != nil
    }
}

