//
//  ChatFeature.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/08.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ChatFeature {
    @ObservableState
    struct State {
        var chatRoom: ChatRoom
    }
    
    enum Action {
        case fetchChatRoom(UUID)
        case fetchedChatRoom(ChatRoom)
        case sendChat(Chat)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchChatRoom(let room_id):
                return .run { send in
                    do {
                        let chatRoom = try await GetChatRoomUseCase().execute(room_id: room_id)
                        await send(.fetchedChatRoom(chatRoom))
                    } catch {
                        print("roomのfetchに失敗しました")
                    }
                }
            case .fetchedChatRoom(let chatRoom):
                state.chatRoom = chatRoom
                return .none
            case .sendChat(let chat):
                let room_id = state.chatRoom.id
                state.chatRoom = state.chatRoom.append(chat)
               
                return .run { send in
                    PostChatUseCase().execute(room_id: room_id, chat: chat)
                    await send(.fetchChatRoom(room_id))
                }
            }
        }
    }
}
