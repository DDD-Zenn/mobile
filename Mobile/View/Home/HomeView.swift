//
//  HomeView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @Bindable var sessionStore: StoreOf<SessionFeature>
    static let store = HomeFeature.store
    @State var message = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                headerView
                
                Spacer()
                
                topicView
                
                Spacer()
                
                CustomTextField(placeholder: "あなたがAiMeeeに聞きたいことは?", delegate: self)
            }
            .padding()
            .onAppear {
                Self.store.send(.fetchChatRooms(self.sessionStore.currentUser!.uid))
            }
        }
    }
}

extension HomeView {
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("こんにちは")
                    .font(.system(size:  20, weight: .bold))
                    .bold()
                Text("urasshさん")
                    .font(.system(size: 36, weight: .bold))
                    .bold()
            }
            
            Spacer()
            
            Circle()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
        }.padding()
    }
    
    private var topicView: some View {
        VStack {
            Text("👻")
                .font(.system(size: 100))
            
            Text("AiMeeeからあなた専用の提案をするよ")
                .frame(width: 180)
                .multilineTextAlignment(.center)
            
            if (Self.store.isLoading) {
                ProgressView()
            } else if (Self.store.chatRooms.isEmpty) {
                Text("まだTopicはありません")
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Self.store.chatRooms) { room in
                            NavigationLink(destination: ChatRoomView(chatRoom: room), label: {
                                ChatRoomCard(chatRoom: room)
                                    .padding()
                            })
                        }
                    }
                }
            }
        }
    }
}

extension HomeView : CustomTextFieldDelegate {
    func textDidChange(to newText: String) {
        message = newText
    }
    
    func didTapReturnKey() {
        let chat = Chat(talker: sessionStore.currentUser!.name, message: message)
        Self.store.send(.sendChat((sessionStore.currentUser!, chat)))
    }
}

#Preview {
    HomeView(sessionStore: SessionFeature.store)
}
