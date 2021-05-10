//
//  User.swift
//  MVPSample
//
//  Created by lucas.henrique.costa on 10/05/21.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let email: String
    let username: String
}

extension User {
    
    struct ViewModel {
        private let user: User
        
        init(user: User) {
            self.user = user
        }
        
        var name: String { user.name }
        var email: String { user.email.lowercased() }
        var username: String { "@" + user.username.lowercased() }
    }
}
