//
//  Session.swift
//  Mobile
//
//  Created by 浦山秀斗 on 2025/02/01.
//

struct Session {
    let uid: String
    let firebaseRefreshToken: String
    let accessToken: String
    let accessTokenSecret: String
    
    
    static let dummy = Session(uid: "dummy", firebaseRefreshToken: "dummy", accessToken: "dummy", accessTokenSecret: "dummy")
}
