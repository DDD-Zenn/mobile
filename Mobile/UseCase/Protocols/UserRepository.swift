//
//  UserRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

protocol UserRepository {
    func fetchByUid(_ uid: String) async throws -> User?
    func create(_ user: User) async throws -> Void
}
