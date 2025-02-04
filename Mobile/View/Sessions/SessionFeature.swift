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
        var sccessSessionCallback: ((Session) -> Void) = { _  in }
        var findUserCallback: ((User?) -> Void) = { _  in }
    }
    
    enum Action {
        case login
        case logout
        case setFindUserCallback((User?) -> Void)
        case findUser
        case setCurrentUser(User)
        case setSccessSessionCallback((Session) -> Void)
        case privateAction(PrivateAction)
    }

    enum PrivateAction {
        case receivedSession(Session)
        case receivedUser(User)
        case notFoundUser
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
                        let session = try await LoginUseCase().execute()
                        await send(.privateAction(.receivedSession(session)))
                        await send(.findUser)
                    } catch let error as AuthError {
                        await send(.privateAction(.catchError(error)))
                    } catch {
                        print("予期しないエラーが発生しました: \(error)")
                    }
                }
            case .logout:
                return .none
            case .setFindUserCallback(let callback):
                state.findUserCallback = callback
                return .none
            case .findUser:
                guard let uid = state.session?.uid else { return .none }
                
                return .run { send in
                    guard let foundUser = try await FindUserUseCase().execute(id: uid) else {
                        await send(.privateAction(.notFoundUser))
                        return
                    }
                    await send(.privateAction(.receivedUser(foundUser)))
                }
            case .setCurrentUser(let user):
                state.currentUser = user
                return .none
            case .setSccessSessionCallback(let callback):
                state.sccessSessionCallback = callback
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
            state.sccessSessionCallback(session)
            state.isLoggedIn = true
        case .receivedUser(let user):
            state.currentUser = user
            state.findUserCallback(user)
        case .notFoundUser:
            state.currentUser = nil
            state.findUserCallback(nil)
        case .catchError(let error):
            print("エラーが発生しました: \(error)")
        }
        return .none
    }
}
