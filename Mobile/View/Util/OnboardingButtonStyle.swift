//
//  OnboardingButtonStyle.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/28.
//

import SwiftUI

extension View {
    func onboardingButton() -> some View {
        self.buttonStyle(OnboardingButtonStyle())
    }
}

struct OnboardingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundStyle(.white)
            .background(.purple)
            .cornerRadius(12)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
