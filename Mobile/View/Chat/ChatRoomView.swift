//
//  ChatRoomView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/05.
//

import SwiftUI

struct ChatRoomView : View {
     var body: some View {
         ZStack {
             VStack {
                 
             }
             .padding()
             
             VStack {
                 AiMeeeView
                 
                 Spacer()
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
        .frame(width: .infinity, height: 400)
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
}



#Preview {
    ChatRoomView()
}
