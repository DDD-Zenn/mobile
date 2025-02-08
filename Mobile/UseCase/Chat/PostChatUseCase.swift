//
//  PostChatUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/07.
//
import Foundation

final class PostChatUseCase {
    private let chatRepository: ChatRepository = DummyChatRoomRepository()
    
    func execute(room_id: UUID, chat: Chat) {
        chatRepository.postChat(with: chat, from: room_id)
    }
}
