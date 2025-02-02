//
//  Session.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import ComposableArchitecture
import Foundation

@Reducer
struct SessionFeature {
    @ObservableState
    struct State {
        var currentUser: User? = nil
        var session: Session? = nil
        var isLoggedIn: Bool = false
    }
    
    enum Action {
        case login
        case signup
        case logout
        case privateAction(PrivateAction)
    }

    enum PrivateAction {
        case receivedSession(Session)
        case receivedUser(User)
        case catchError(AuthError)
    }

    static let store = Store(initialState: Self.State()) {
        SessionFeature()
            ._printChanges()
    }
    
    private init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .login:
                return .run { send in
                    do {
                        let (loginUser, session) = try await LoginUseCase().execute()
                        await send(.privateAction(.receivedUser(loginUser)))
                        await send(.privateAction(.receivedSession(session)))
                    } catch let error as AuthError {
                        await send(.privateAction(.catchError(error)))
                    } catch {
                        print("予期しないエラーが発生しました: \(error)")
                    }
                }
            case .signup:
                return .none
            case .logout:
                return .none
            case .privateAction(let privateAction):
                return handleInternalAction(&state, privateAction)
            }
        }
    }
    
    private func handleInternalAction(_ state: inout State, _ action: PrivateAction) -> Effect<Action> {
        switch action {
        case .receivedSession(let session):
            state.session = session
            state.isLoggedIn = true
        case .receivedUser(let user):
            state.currentUser = user
        case .catchError(let error):
            print("エラーが発生しました: \(error)")
        }
        return .none
    }
}
