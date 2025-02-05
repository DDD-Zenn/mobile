//
//  GetTopicsUseCase.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

final class GetTopicsUseCase {
    private let topicRepository: TopicRepository = DummyTopicRepository()
    
    func execute() async -> [Topic] {
        return await topicRepository.fetchTopics()
    }
}
