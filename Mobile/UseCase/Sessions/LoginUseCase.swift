//
//  LoginUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

struct LoginUseCase {
    private let sessionRepository: SessionRepository = DummySessionRepository()
    private let userRepository: UserRepository = DummyUserRepository()
    
    func execute() async throws -> (User, Session) {
        let session = try await sessionRepository.login()
        let user = try await userRepository.fetchByUid(session.uid)!
        return (user, session)
    }
}
