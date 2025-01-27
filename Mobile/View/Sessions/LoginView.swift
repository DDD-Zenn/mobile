//
//  LoginView.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/27.
//

import SwiftUI

struct LoginView: View {
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
                    
                    NavigationLink(destination: OnboardingView()) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .foregroundStyle(.white)
                            
                            Text("Continue With Apple")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                        }
                            .frame(width: 250, height: 60)
                            .background(Color.black)
                            .clipShape (
                                RoundedRectangle(cornerRadius: 40)
                            )
                    }
                    
                    NavigationLink(destination: OnboardingView()) {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Continue With Google")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        }
                            .frame(width: 250, height: 60)
                            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                            .clipShape (
                                RoundedRectangle(cornerRadius: 40)
                            )
                    }
                }
            }.padding(.all, 64)
        }
        
        
    }
}

#Preview {
    LoginView()
}
