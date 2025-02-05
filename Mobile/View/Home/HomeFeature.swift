//
//  HomeFeature.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

import ComposableArchitecture

@Reducer
struct HomeFeature {
    @ObservableState
    struct State {
        var topics: [Topic] = []
        var isLoadingTopics: Bool = false
    }
    
    enum Action {
        case fetchTopics
        case topicsFetched([Topic])
    }
    
    static let store = Store(initialState: Self.State()) {
        HomeFeature()
    }
    
    private init() {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchTopics:
                state.isLoadingTopics = true
                return .run { send in
                    let topics = await GetTopicsUseCase().execute()
                    await send(.topicsFetched(topics))
                }
            case .topicsFetched(let topics):
                state.topics = topics
                state.isLoadingTopics = false
                return .none
            }
        }
    }
}
