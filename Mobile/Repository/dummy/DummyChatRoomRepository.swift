//
//  DummyChatRoomRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//
import Foundation

final class DummyChatRoomRepository: ChatRepository {
    private var chatRooms: [ChatRoom] = [
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "えっ！？推しにいいねされたの！？どんなツイートだったの！？🔥"),
        ], topicType: .suprize),
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "旅行の写真、すごく楽しそうだった！どこ行ったの？オススメある？✨"),
        ], topicType: .happy),
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "金縛りにあったって！？どんな感じだったの！？怖すぎる…😱"),
        ], topicType: .horror),
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "エレベーターで間違えて知らない人と一緒に降りちゃったって…戻るタイミング迷うよね😅どうしたの？"),
        ], topicType: .embarrassing),
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "お昼に食べてたラーメン、めっちゃ美味しそうだったね！あれ、どこのお店？🍜"),
        ], topicType: .suprize),
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "ちょっと元気なさそうだけど、大丈夫？何かあったのかな…🥺"),
        ], topicType: .sad),
        ChatRoom(user: .dummy, chats: [
            Chat(talker: "AiMeee", message: "スマホ落としたのに画面無傷！？奇跡じゃん！何か特別なケース使ってるの？📱"),
        ], topicType: .suprize),
    ]
    
    func fetchChatRoom(uid: String) async throws -> [ChatRoom] {
        let result = chatRooms.filter {
            uid != $0.user.uid
        }
        
        guard result != [] else {
            throw ChatError.undefinedChatRoom
        }
        
        return result
    }
    
    func fetchChatRoom(room_id: UUID) async throws -> ChatRoom {
        let result = chatRooms.first {
            room_id == $0.id
        }
        
        guard result != nil else {
            throw ChatError.undefinedChatRoom
        }
            
        return result!
    }
    
    func createChatRoom(chatRoom: ChatRoom) {
        chatRooms.append(chatRoom)
    }
    
    func postChat(with chat: Chat, from room_id: UUID) {
        chatRooms = chatRooms.map {
            room_id == $0.id ? $0.append(chat) : $0
        }
    }
}
