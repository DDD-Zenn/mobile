//
//  SessionRepositoryProtocol.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

protocol SessionRepository {
    func login() async throws -> Session
}
