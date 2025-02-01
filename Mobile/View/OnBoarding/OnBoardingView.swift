//
//  OnBoardingView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/27.
//

import SwiftUI
import ComposableArchitecture

struct OnBoardingView: View {
    @Bindable var store: StoreOf<OnBoardingFeature>

    var body: some View {
        VStack {
            switch store.onBoardingState {
            case .Hello:
                helloView
            case .Name:
                nameView
            case .Generating:
                generatingView
            case .Generated:
                generatedView
            }
        }
        .padding(.all, 32)
        .animation(.easeInOut, value: store.onBoardingState)
    }
}

extension OnBoardingView {
    private var helloView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("Hello!")
                .font(.system(size: 64))
                .bold()
            
            OnBoardingIcon(icon: .robot)
            
            Text("このアプリはあなた専用のAIキャラクターを作成し，あなたの相談役になってくれます")
                .multilineTextAlignment(.center)
            
            Button("Next") {
                store.send(.updateState(.Name))
            }
            .OnBoardingButton()
        }
    }
    
    private var nameView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("あなたの名前は？")
                .font(.system(size: 32))
                .bold()
            
            OnBoardingIcon(icon: .thinking)
            
            CustomTextField(placeholder: "name", delegate: self)
                
            Button("Next") {
                store.send(.updateState(.Generating))
            }
            .OnBoardingButton()
        }
    }
    
    private var generatingView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("もう少し！")
                .font(.system(size: 32))
                .bold()
            
            OnBoardingIcon(icon: .thinking)
            
            Text("あなた専用のAIを作成中です最後にもう少しだけあなたのことを教えてください")
                .multilineTextAlignment(.center)
            
            Button("Next") {
                store.send(.updateState(.Generated))
            }
            .OnBoardingButton()
        }
    }
    
    private var generatedView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("はじめよう！")
                .font(.largeTitle)
                .padding()
            
            Text("あなた専用のAIを作成しました！しかし，彼はまだだあなたのことを理解しきれていないかもしれません。使えば使うほど，あなた専用にカスタマイズされていきます")
            
            OnBoardingIcon(icon: .check)
            
            Button("はじめる") {
                store.send(.finishedOnBoarding)
            }
            .OnBoardingButton()
        }
    }
}

extension OnBoardingView : CustomTextFieldDelegate {
    func textDidChange(to newText: String) {
        print("name: \(newText)")
    }
}

#Preview {
    OnBoardingView(store: OnBoardingFeature.store)
}
