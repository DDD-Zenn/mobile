//
//  DummyUserRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

final class DummyUserRepository : UserRepository {
    func fetchByUid(_ uid: String) -> User? {
        .dummy
    }
}
