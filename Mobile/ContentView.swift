//
//  ContentView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/20.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    static let sessionStore = SessionFeature.store
    static let onBoardingStore = OnBoardingFeature.store
    
    init() {        
        // ログイン時にユーザに見つけられた場合のコールバック
        Self.sessionStore.send(.setFindUserCallback( { user in
            if user == nil { return }
            Self.onBoardingStore.send(.skipOnBoarding)
        }))
        
        Self.sessionStore.send(.setSccessSessionCallback( { session in
            Self.onBoardingStore.send(.setUID(session.uid))
        }))
        
        // オンボーディングの過程でユーザを作成し、currentUserにするコールバック
        Self.onBoardingStore.send(.registerdUserCallback( { user in
            guard let createdUser = user else { return }
            Self.sessionStore.send(.setCurrentUser(createdUser))
        }))
    }
    
    var body: some View {
        Group {
            if !Self.sessionStore.isLoggedIn {
                LoginView(store: Self.sessionStore)
            } else if Self.onBoardingStore.shouldOnBoarding {
                OnBoardingView(store: Self.onBoardingStore)
            } else {
                HomeView(sessionStore: Self.sessionStore)
            }
        }
    }
}

#Preview {
    ContentView()
}
