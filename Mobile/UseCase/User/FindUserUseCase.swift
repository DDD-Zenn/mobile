//
//  FindUserUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

final class FindUserUseCase {
    private let repository: UserRepository = DummyUserRepository()
    
    func execute(id: String) async throws -> User? {
        return try await repository.fetchByUid(id)
    }
}
