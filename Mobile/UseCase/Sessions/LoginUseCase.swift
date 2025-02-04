//
//  LoginUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import Foundation

struct LoginUseCase {
    private let sessionRepository: SessionRepository = DummySessionRepository()
    private let userRepository: UserRepository = DummyUserRepository()
    private let key = "hasLaunchedBefore"
    
    func execute() async throws -> Session {
        return try await sessionRepository.login()
    }
}
