//
//  ChatRoom.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

import Foundation

struct ChatRoom : Identifiable, Equatable {
    let id: UUID
    let user: User
    let chats: [Chat]
    let topicType: TopicType
    
    init(id: UUID = UUID(), user: User, chats: [Chat] = [], topicType: TopicType) {
        self.id = id
        self.user = user
        self.chats = chats
        self.topicType = topicType
    }
    
    func append(_ chat: Chat) -> ChatRoom {
        ChatRoom(id: id, user: user, chats: chats + [chat], topicType: topicType)
    }
    
    static func == (lhs: ChatRoom, rhs: ChatRoom) -> Bool {
        lhs.id == rhs.id
    }
}
