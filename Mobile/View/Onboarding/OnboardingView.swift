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
        .padding()
        .animation(.easeInOut, value: onBoardingState)
    }
}

extension OnboardingView {
    private var helloView: some View {
        VStack {
            Text("Hello")
                .font(.largeTitle)
                .padding()
            
            Text("このアプリはあなた専用のAIキャラクターを作成し，あなたの相談役になってくれます")
            
            Button("Next") {
                onBoardingState = .Name
            }
            .onboardingButton()
        }
    }
    
    private var nameView: some View {
        VStack {
            Text("What is your name?")
                .font(.largeTitle)
                .padding()
            TextField("Name", text: $name)
                .padding()
            Button("Next") {
                onBoardingState = .Generating
            }
            .onboardingButton()
        }
    }
    
    private var generatingView: some View {
        VStack {
            Text("Hello, \(name)!")
                .font(.title)
                .padding()
            Text("Generating your personalized experience...")
                .padding()
            
            Button("Next") {
                onBoardingState = .Generated
            }
            .onboardingButton()
        }
    }
    
    
    private var generatedView: some View {
        VStack {
            Text("Hello, \(name)!")
                .font(.title)
                .padding()
            Text("Your personalized experience is ready!")
                .padding()
        }
    }
    
}


#Preview {
    OnboardingView()
}
