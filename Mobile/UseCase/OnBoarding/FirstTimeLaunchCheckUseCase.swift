//
//  FirstTimeUserCheckUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import Foundation

final class FirstTimeLaunchCheckUseCase {
    private let key = "hasLaunchedBefore"
    
    func execute() -> Bool {
        let defaults = UserDefaults.standard
        
        if defaults.bool(forKey: key) {
            return false
        }
        
        return true
    }
}
