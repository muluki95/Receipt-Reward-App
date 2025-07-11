//
//  User.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/8/25.
//

import Foundation
 

struct User: Codable, Identifiable {
    let id: String
    let fullname: String
    let email: String
    
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var sample = User(id: "1", fullname:"Esther Nzomo", email:"esther@example.com")
}
