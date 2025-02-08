//
//  Topic.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

import SwiftUICore

enum TopicType {
    case happy
    case sad
    case suprize
    case horror
    case embarrassing
    
    var icon: String {
        switch self {
        case .happy:
            return "☺️"
        case .sad:
            return "🥹"
        case .suprize:
            return "🤯"
        case .horror:
            return "😨"
        case .embarrassing:
            return "🫣"
        }
    }
    
    var style: Color {
        switch self {
        case .happy:
            return .pink
        case .sad:
            return .cyan
        case .suprize:
            return .orange
        case .horror:
            return .black
        case .embarrassing:
            return .red
        }
    }
    
    static var random: TopicType {
        let topics: [TopicType] = [.happy, .sad, .suprize, .horror, .embarrassing]
        return topics.randomElement() ?? .happy
    }
}
