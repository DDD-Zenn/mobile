//
//  ChatView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

import SwiftUI

struct ChatBubbleView: View {
    let message: String
    let sender: String

    var body: some View {
        userChatBubbleView
    }
}

extension ChatBubbleView {
    private var aiMeeeChatBubbleView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(message)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .fontDesign(.rounded)
            
            Text(sender)
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .fontDesign(.rounded)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .frame(maxWidth: 290, alignment: .leading)
    }
    
    private var userChatBubbleView: some View {
        VStack(alignment: .trailing, spacing: 4) {
            Text(message)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .fontDesign(.rounded)
            
            Text(sender)
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

#Preview {
    ChatBubbleView(
        message: "最近、”泣きたい”ってツイートしてたけど、どうしたの？",
        sender: "Aimeee"
    )
}


