//
//  LoginView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/27.
//

import SwiftUI
import ComposableArchitecture

struct LoginView: View {
    @Bindable var store: StoreOf<SessionFeature>
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                VStack {
                    Text("👻")
                        .font(.system(size: 96))

                    Text("AiMeee")
                        .font(.system(size: 52))

                    Text("あなただけのAIを育てよう")
                }

                Spacer()

                VStack (spacing: 32){
                    Text("アカウントを作成 / ログイン")
                    
                    Button(action: {
                        store.send(.login)
                    }, label: {
                        HStack {
                            Image("x")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Continue With X (Twitter)")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                            .frame(width: 300, height: 60)
                            .background(Color.black)
                            .clipShape (
                                RoundedRectangle(cornerRadius: 40)
                            )
                    })
                }
            }.padding(.all, 64)
        }
    }
}

#Preview {
    LoginView(store: SessionFeature.store)
}
