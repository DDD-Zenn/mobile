//
//  AddChatRoomUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/08.
//

final class AddChatRoomUseCase {
    private let repository: ChatRepository = DummyChatRoomRepository()
    
    func execute(chatRoom: ChatRoom) {
        repository.createChatRoom(chatRoom: chatRoom)
    }
}
