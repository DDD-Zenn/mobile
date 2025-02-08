//
//  ChatRoomCard.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

import SwiftUI

struct ChatRoomCard : View {
    let chatRoom: ChatRoom
    
    var body: some View {
        VStack {
            Text("TOPIC")
                .bold()
                .foregroundStyle(.black)
            
            Spacer()
            
            Text(chatRoom.topicType.icon)
                .font(.largeTitle)
                .foregroundStyle(.black)
            
            Spacer()
            
            Text(chatRoom.chats.first?.message ?? "")
                .bold()
                .foregroundStyle(.black)
        }
        .padding()
        .frame(width: 200, height: 160)
        .background(Color.white)
        .foregroundStyle(.secondary)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(chatRoom.topicType.style.opacity(0.4), lineWidth: 4))
        .shadow(radius: 4)
    }
}
