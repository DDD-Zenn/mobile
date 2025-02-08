//
//  ChatRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

import Foundation

protocol ChatRepository {
    func fetchChatRoom(uid: String) async throws -> [ChatRoom]
    func fetchChatRoom(room_id: UUID) async throws -> ChatRoom
    func createChatRoom(chatRoom: ChatRoom)
    func postChat(with chat: Chat, from room_id: UUID)
}
