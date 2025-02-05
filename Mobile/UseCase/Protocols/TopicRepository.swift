//
//  TopicRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

protocol TopicRepository {
    func fetchTopics() async -> [Topic]
}
