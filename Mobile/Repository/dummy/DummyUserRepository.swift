//
//  DummyUserRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

final class DummyUserRepository : UserRepository {
    private static var users: [User] = [
        .dummy
    ]
    
    func fetchByUid(_ uid: String) -> User? {
        return Self.users.first(where: { $0.uid == uid })
    }
    
    func create(_ user: User) async throws {
        Self.users.append(user)
    }
}
