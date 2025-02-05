//
//  HomeView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import SwiftUI

struct HomeView: View {
    static let store = HomeFeature.store
    
    init() {
        Self.store.send(.fetchTopics)
    }
    
    var body: some View {
        VStack {
            headerView
            
            Spacer()
            
            topicView
            
            Spacer()
            
            CustomTextField(placeholder: "あなたがAiMeeeに聞きたいことは?", delegate: self)
        }
        .padding()
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
            
            if (Self.store.isLoadingTopics) {
                ProgressView()
            } else if (Self.store.topics.isEmpty) {
                Text("まだTopicはありません")
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(Self.store.topics, id: \.self) { topic in
                            ChatRoomCard(topic: topic)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

extension HomeView : CustomTextFieldDelegate {
    func textDidChange(to newText: String) {
        
    }
}

#Preview {
    HomeView()
}
