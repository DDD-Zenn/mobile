//
//  SessionRepositoryImpl.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import FirebaseAuth
import FirebaseCore
import AuthenticationServices

final class SessionRepositoryImpl : SessionRepository {
    func login() async throws -> Session {
        guard let credential = try await getCredential(),
              let OAuthCredential = credential as? OAuthCredential else {
            throw AuthError.invalidCredential
        }
        
        do {
            let authResult = try await Auth.auth().signIn(with: OAuthCredential)
            let user = authResult.user
            
            guard let refreshToken = user.refreshToken else {
                throw AuthError.missingRefreshToken
            }
            
            guard let accessToken = OAuthCredential.accessToken,
                  let accessTokenSecret = OAuthCredential.secret else {
                throw AuthError.missingOAuthToken
            }
            
            return Session(uid: user.uid, firebaseRefreshToken: refreshToken, accessToken: accessToken, accessTokenSecret: accessTokenSecret)
        } catch {
            throw AuthError.failureSignIn
        }
    }
    
    private func getCredential() async throws -> AuthCredential? {
        let provider = OAuthProvider(providerID: "twitter.com")
        
        return await withCheckedContinuation { continuation in
            
            provider.getCredentialWith(nil) { credential, error in
                if let error = error {
                    continuation.resume(throwing: error as! Never)
                } else if let credential = credential {
                    continuation.resume(returning: credential)
                } else {
                    continuation.resume(throwing: NSError(domain: "AuthError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"]) as! Never)
                }
            }
        }
    }
}
