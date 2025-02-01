//
//  OnboardingIcon.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/01/30.
//

import SwiftUI

enum Icon {
    case thinking
    case robot
    case check
    
    func toString() -> String {
        switch self {
        case .thinking:
            return "🤔"
        case .robot:
            return "🤖"
        case .check:
            return "✅"
        }
    }
}

struct OnboardingIcon : View {
    let icon: Icon
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.purple)
            
            Text(icon.toString())
                .font(.largeTitle)
        }
    }
}
