//
//  User.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/25.
//

import Foundation

struct User {
    let uid: String
    let name: String
    
    static let dummy: User = .init(
        uid: "dummy_uid",
        name: "Anonymous"
    )
    
    init(uid: String, name: String) {
        self.uid = uid
        self.name = name
    }
}
