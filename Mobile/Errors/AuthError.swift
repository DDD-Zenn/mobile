//
//  AuthError.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

enum AuthError : Error {
    case invalidCredential
    case missingRefreshToken
    case missingOAuthToken
    case failureSignIn
    
}
