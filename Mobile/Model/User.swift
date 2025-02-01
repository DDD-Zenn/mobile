//
//  User.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/25.
//

import Foundation

struct User : Identifiable, Equatable {
    let id: UUID
    let name: String
    let email: String
    
    static let dummy: User = .init(
        id: UUID(),
        name: "Anonymous",
        email: "anonymous@example.com"
    )
}
