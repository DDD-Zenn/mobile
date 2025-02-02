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
        var isFirstTimeLaunch: Bool = true
    }
    
    enum Action {
        case finishedOnBoarding
        case checkFirstTimeLaunch
        case updateState(OnBoardingState)
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
            case .finishedOnBoarding:
                FinishOnBoardingUseCase().execute()
                state.isFirstTimeLaunch = false
                return .none
            case .checkFirstTimeLaunch:
                let usecase = FirstTimeLaunchCheckUseCase()
                state.isFirstTimeLaunch = usecase.execute()
                return .none
            case .updateState(let newState):
                state.onBoardingState = newState
                return .none
            }
        }
    }
}
