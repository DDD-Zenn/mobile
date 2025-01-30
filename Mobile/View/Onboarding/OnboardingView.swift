//
//  OnboardingView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/27.
//

import SwiftUI

import SwiftUI

struct OnboardingView: View {
    private enum OnboardingState {
        case Hello
        case Name
        case Generating
        case Generated
    }
    
    @State private var onBoardingState: OnboardingState = .Hello
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            switch onBoardingState {
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
        .animation(.easeInOut, value: onBoardingState)
    }
}

extension OnboardingView {
    private var helloView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("Hello!")
                .font(.system(size: 64))
                .bold()
            
            OnboardingIcon(icon: .robot)
            
            Text("このアプリはあなた専用のAIキャラクターを作成し，あなたの相談役になってくれます")
                .multilineTextAlignment(.center)
            
            Button("Next") {
                onBoardingState = .Name
            }
            .onboardingButton()
        }
    }
    
    private var nameView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("あなたの名前は？")
                .font(.system(size: 32))
                .bold()
            
            OnboardingIcon(icon: .thinking)
            
            CustomTextField(placeholder: "name", delegate: self)
                
            Button("Next") {
                onBoardingState = .Generating
            }
            .onboardingButton()
        }
    }
    
    private var generatingView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("もう少し！")
                .font(.system(size: 32))
                .bold()
            
            OnboardingIcon(icon: .thinking)
            
            Text("あなた専用のAIを作成中です最後にもう少しだけあなたのことを教えてください")
                .multilineTextAlignment(.center)
            
            Button("Next") {
                onBoardingState = .Generated
            }
            .onboardingButton()
        }
    }
    
    private var generatedView: some View {
        VStack (alignment: .center, spacing: 64){
            Text("Hello, \(name)!")
                .font(.title)
                .padding()
            
            OnboardingIcon(icon: .check)
            
            Button("はじめる") {
                
            }
            .onboardingButton()
        }
    }
}

extension OnboardingView : CustomTextFieldDelegate {
    func textDidChange(to newText: String) {
        print("name: \(newText)")
        name = newText
    }
}

#Preview {
    OnboardingView()
}
