//
//  ChatRoomCard.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

import SwiftUI

struct ChatRoomCard : View {
    
    var body: some View {
        VStack {
            Text("TOPIC")
                .bold()
            
            Spacer()
            
            Text("🥲")
                .font(.largeTitle)
            
            Spacer()
            
            Text("最近、彼女とうまくいかないんだって?")
                .bold()
        }
        .padding()
        .frame(width: 200, height: 160)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.cyan.opacity(0.4), lineWidth: 4))
        .shadow(radius: 4)
    }
}


#Preview {
    ChatRoomCard()
}
