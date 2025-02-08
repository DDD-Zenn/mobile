//
//  OnBoardingFeature.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

import ComposableArchitecture
import Foundation

@Reducer
struct OnBoardingFeature {
    @ObservableState
    struct State {
        var onBoardingState: OnBoardingState = .Hello
        var shouldOnBoarding: Bool = true
        var uid: String? = nil
        var username: String? = nil
        var registerdUserCallback: ((User?) -> Void) = { _ in }
        var errorText: String = ""
    }
    
    enum Action {
        case createUser
        case skipOnBoarding
        case updateState(OnBoardingState)
        case doneOnBoarding
        case registerdUserCallback((User?) -> Void)
        case createdUser(User)
        case failedToCreateUser(Error)
        case setUID(String)
        case setUsername(String)
    }
    
    enum OnBoardingState {
        case Hello
        case Name
        case Generating
        case Generated
    }
    
    static let store = Store(initialState: Self.State()) {
        OnBoardingFeature()
            ._printChanges()
    }
    
    private init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .createUser:
                guard let uid = state.uid else { return .none }
                guard let name = state.username else { return .none }
                return .run { send in
                    do {
                        try await CreateUserUseCase().execute(uid: uid, name: name)
                        await send(.createdUser(.init(uid: uid, name: name)))
                    } catch {
                        await send(.failedToCreateUser(error))
                    }
                }
            case .skipOnBoarding:
                state.shouldOnBoarding = false
                return .none
            case .updateState(let newState):
                if (newState == .Generating && state.username == nil) {
                    state.errorText = "名前が空欄です。入力してください。"
                    return .none
                }
                state.onBoardingState = newState
                return .none
            case .doneOnBoarding:
                state.shouldOnBoarding = false
                return .none
            case .registerdUserCallback(let callback):
                state.registerdUserCallback = callback
                return .none
            case .createdUser(let user):
                state.registerdUserCallback(user)
                return .run { send in
                    await send(.doneOnBoarding)
                }
            case .failedToCreateUser(let error):
                state.registerdUserCallback(nil)
                print("fail create user: \(error)")
                return .none
            case .setUID(let uid):
                state.uid = uid
                return .none
            case .setUsername(let username):
                state.username = username
                return .none
            }
        }
    }
}
