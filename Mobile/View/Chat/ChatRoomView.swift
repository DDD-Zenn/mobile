//
//  ChatRoomView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

import SwiftUI
import ComposableArchitecture

struct ChatRoomView : View {
    @Environment(\.dismiss) private var dismiss
    @State private var message: String = ""
    private let store: StoreOf<ChatFeature>
    
    init(chatRoom: ChatRoom) {
        store = Store(initialState: ChatFeature.State(chatRoom: chatRoom)) {
            ChatFeature()
        }
    }
    
     var body: some View {
         ZStack {
             VStack {
                 AiMeeeView
                 
                 Spacer()
             }
             
             VStack {
                 chatView
                 
                 HStack {
                     TextField("AiMeeeと話そう！", text: $message)
                         .padding(.horizontal, 12)
                         .frame(height: 40)
                         .background(Color(UIColor.systemGray6))
                         .cornerRadius(20)
                     
                     Button(action: {
                         let chat = Chat(talker: store.chatRoom.user.name, message: message)
                         store.send(.sendChat(chat))
                         message = ""
                     }, label: {
                         Image(systemName: "paperplane")
                             .foregroundColor(.black)
                             .padding(.horizontal, 10)
                     })
                 }
                 .padding()
                 .background(Color.white)
                 .clipShape(RoundedRectangle(cornerRadius: 20))
                 .shadow(radius: 2)
             }
             .padding(.horizontal)
         }
         .navigationBarBackButtonHidden(true)
         .toolbar {
             ToolbarItem(placement: .navigationBarLeading) {
                 Button(
                     action: {
                         dismiss()
                     }, label: {
                         HStack(spacing: 2) {
                             Image(systemName: "chevron.backward")
                                 .foregroundStyle(.white)
                             Text("Back")
                                 .foregroundStyle(.white)
                         }
                         
                     }
                 ).tint(.orange)
             }
         }
    }
}

extension ChatRoomView {
    private var AiMeeeView: some View {
        ZStack {
            gradationView
            
            VStack {
                Text("👻")
                    .font(.system(size: 84))
                
                Text("Aimeee")
                    .font(.system(size: 42))
                    .fontDesign(.rounded)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
            }
        }
        .frame(height: 400)
    }
    
    private var gradationView: some View {
        Rectangle()
          .foregroundColor(.clear)
          .background(
            LinearGradient(
              stops: [
                Gradient.Stop(color: Color(red: 0.28, green: 0.34, blue: 1), location: 0.00),
                Gradient.Stop(color: Color(red: 0.69, green: 0.45, blue: 1).opacity(0.76), location: 0.31),
                Gradient.Stop(color: Color(red: 1, green: 0.61, blue: 0.97).opacity(0.55), location: 0.61),
                Gradient.Stop(color: .white.opacity(0), location: 1.00),
              ],
              startPoint: UnitPoint(x: 0.5, y: 0),
              endPoint: UnitPoint(x: 0.5, y: 1)
            )
          )
    }
    
    private var chatView: some View {
        ScrollView (.vertical) {
            VStack {
                ForEach(store.chatRoom.chats) { chat in
                    ChatBubbleView(chat: chat)
                }
            }
        }
    }
}
