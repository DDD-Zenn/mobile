//
//  Chat.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//
import Foundation

struct Chat : Identifiable {
    let id: UUID
    let talker: String
    let message: String
    
    init(id: UUID = UUID(), talker: String, message: String) {
        self.id = id
        self.talker = talker
        self.message = message
    }
    
    var isAiMeee : Bool {
        talker == "AiMeee"
    }
}
