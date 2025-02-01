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
//        Self.onBoardingStore.send(.checkFirstTimeLaunch)
    }
    
    var body: some View {
        Group {
            if !Self.sessionStore.isLoggedIn {
                LoginView(store: Self.sessionStore)
            } else if Self.onBoardingStore.isFirstTimeLaunch {
                OnBoardingView(store: Self.onBoardingStore)
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
