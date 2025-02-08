//
//  GetChatRoomUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/08.
//
import Foundation

final class GetChatRoomUseCase {
    private let repository: ChatRepository = DummyChatRoomRepository()
    
    func execute(room_id: UUID) async throws -> ChatRoom {
        return try await repository.fetchChatRoom(room_id: room_id)
    }
}
