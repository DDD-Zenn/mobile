//
//  DummyTopicRepository.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/04.
//

final class DummyTopicRepository : TopicRepository {
    private static let topics: [Topic] = [
        Topic(type: .happy, content: "お昼に食べてたラーメン、めっちゃ美味しそうだったね！あれ、どこのお店？🍜"),
        Topic(type: .happy, content: "今日すごく楽しそうだったね！何か良いことあったの？🤩"),
        Topic(type: .sad, content: "ちょっと元気なさそうだけど、大丈夫？何かあったのかな…🥺"),
        Topic(type: .sad, content: "最近忙しそうだね。ちゃんと休めてる？無理しないでね！"),
        Topic(type: .suprize, content: "えっ！？推しにいいねされたの！？どんなツイートだったの！？🔥"),
        Topic(type: .suprize, content: "さっきのツイート、何が起こったの！？めっちゃ気になるんだけど！😳"),
        Topic(type: .horror, content: "夜中に聞こえた変な音って何だったの…？まさか…😨"),
        Topic(type: .horror, content: "金縛りにあったって！？どんな感じだったの！？怖すぎる…😱"),
        Topic(type: .embarrassing, content: "コンビニで「ポイントカードありますか？」に「大丈夫です！」って答えちゃったの、めっちゃ分かる🤣"),
        Topic(type: .embarrassing, content: "エレベーターで間違えて知らない人と一緒に降りちゃったって…戻るタイミング迷うよね😅どうしたの？"),
        Topic(type: .happy, content: "旅行の写真、すごく楽しそうだった！どこ行ったの？オススメある？✨"),
        Topic(type: .suprize, content: "スマホ落としたのに画面無傷！？奇跡じゃん！何か特別なケース使ってるの？📱")
    ]
    
    func fetchTopics() async -> [Topic] {
        return Self.topics
    }    
}
