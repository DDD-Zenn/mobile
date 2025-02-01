//
//  FinishOnBoardingUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import Foundation

final class FinishOnBoardingUseCase {
    private let key = "hasLaunchedBefore"
    
    func execute() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: key)
        defaults.synchronize()
    }
}
