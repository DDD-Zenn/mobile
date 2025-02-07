import FirebaseAuth
import FirebaseCore
import AuthenticationServices

final class SessionRepositoryImpl: SessionRepository {
    func login() async throws -> Session {
        guard let credential = try await getCredential(),
              let oAuthCredential = credential as? OAuthCredential else {
            throw AuthError.invalidCredential
        }
        
        do {
            let authResult = try await Auth.auth().signIn(with: oAuthCredential)
            let user = authResult.user
            
            guard let refreshToken = user.refreshToken else {
                throw AuthError.missingRefreshToken
            }
            
            let accessToken = oAuthCredential.accessToken ?? ""
            let accessTokenSecret = oAuthCredential.secret ?? ""
            
            return Session(
                uid: user.uid,
                firebaseRefreshToken: refreshToken,
                accessToken: accessToken,
                accessTokenSecret: accessTokenSecret
            )
        } catch {
            throw AuthError.failureSignIn
        }
    }
    
    private func getCredential() async throws -> AuthCredential? {
        let provider = OAuthProvider(providerID: "twitter.com")
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.getCredentialWith(nil) { credential, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let credential = credential {
                    continuation.resume(returning: credential)
                } else {
                    let unknownError = NSError(domain: "AuthError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])
                    continuation.resume(throwing: unknownError)
                }
            }
        }
    }
}
