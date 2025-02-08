//
//  HomeFeature.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct State {
        var chatRooms: [ChatRoom] = []
        var isLoading: Bool = false
    }
    
    enum Action {
        case fetchChatRooms(String)
        case fetchedChatRooms([ChatRoom])
        case sendChat((User, Chat))
    }
    
    static let store = Store(initialState: Self.State()) {
        HomeFeature()
    }
    
    private init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchChatRooms(let uid):
                state.isLoading = true
                return .run { send in
                    do {
                        let chatRoom = try await GetChatRoomsUseCsae().execute(uid: uid)
                        await send(.fetchedChatRooms(chatRoom))
                    } catch {
                        print("error: \(error)")
                    }
                }
            case .fetchedChatRooms(let chatRooms):
                state.chatRooms = chatRooms
                state.isLoading = false
                return .none
            case .sendChat((let user, let chat)):
                return .run { _ in
                    let chatRoom = ChatRoom(user: user, topicType: .happy).append(chat)
                    AddChatRoomUseCase().execute(chatRoom: chatRoom)
                }
            }
        }
    }
}
