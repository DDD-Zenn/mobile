//
//  CreateUserUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

final class CreateUserUseCase {
    private let repository: UserRepository = DummyUserRepository()
    
    func execute(uid: String, name: String) async throws -> Void {
        let user: User = .init(uid: uid, name: name)
        try await repository.create(user)
    }
}
