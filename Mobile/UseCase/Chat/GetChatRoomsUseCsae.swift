//
//  GetChatRoomRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

final class GetChatRoomsUseCsae {
    private let chatRoomRepository: ChatRepository = DummyChatRoomRepository()
    
    func execute(uid: String) async throws -> [ChatRoom] {
        try await chatRoomRepository.fetchChatRoom(uid: uid)
    }
}
