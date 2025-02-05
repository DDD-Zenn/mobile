//
//  ChatRoomCard.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

import SwiftUI

struct ChatRoomCard : View {
    let topic: Topic
    
    var body: some View {
        VStack {
            Text("TOPIC")
                .bold()
            
            Spacer()
            
            Text(topic.type.icon)
                .font(.largeTitle)
            
            Spacer()
            
            Text(topic.content)
                .bold()
        }
        .padding()
        .frame(width: 200, height: 160)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(topic.type.style.opacity(0.4), lineWidth: 4))
        .shadow(radius: 4)
    }
}


#Preview {
    ChatRoomCard(topic: Topic(type: .sad, content: "大丈夫？最近彼女と別れたの？"))
}
