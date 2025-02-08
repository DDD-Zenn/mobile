//
//  ChatView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

import SwiftUI

struct ChatBubbleView: View {
    let chat: Chat

    var body: some View {
        Group {
            if chat.isAiMeee {
                aiMeeeChatBubbleView
            } else {
                userChatBubbleView
            }
        }
    }
}

extension ChatBubbleView {
    private var aiMeeeChatBubbleView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(chat.message)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .fontDesign(.rounded)
                
                Text(chat.talker)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .fontDesign(.rounded)
            }
            .padding(12)
            .background(Color.white.opacity(0.8 ))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .frame(maxWidth: 290, alignment: .leading)
            
            Spacer()
        }
    }
    
    private var userChatBubbleView: some View {
        HStack {
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(chat.message)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .fontDesign(.rounded)
                
                Text(chat.talker)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .fontDesign(.rounded)
            }
            .padding(12)
            .background(Color(red: 0.9, green: 1, blue: 0.85))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            .frame(maxWidth: 290, alignment: .trailing)
        }
    }
}

#Preview {
    ChatBubbleView(
        chat: Chat(
            talker: "AiMeee", message: "最近、”泣きたい”ってツイートしてたけど、どうしたの？"
        )
        
    )
}


