//
//  Profile.swift
//  quest3
//
//  Created by Gemma Emery on 1/26/24.
//

import Foundation

enum PlayerStatus {
    case IN_PLAY
    case SEARCH
    case IDLE
    case OFFLINE
}

class Profile {
    let id: UUID
    let nickname: String
    let age: Int
    let name: String
    let creationDate: String
    var status: PlayerStatus
    lazy var link: String = "http://gameserver.com/\(self.id)-\(self.nickname)"
    
    var playerActionDelegate : PlayerAction? = nil
    
    static let formatter : DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.YYYY HH:mm:ss"
        return df
    }()
    
    init(nick: String, age: Int, name: String) {
        self.id = UUID.init()
        self.nickname = nick
        self.age = age
        self.name = name
        self.creationDate = Profile.formatter.string(from: NSDate() as Date)
        self.status = PlayerStatus.IDLE
    }
    
//    var description: String {
//        return "Profile(\"\(nickname)\", \(status))"
//    }
    
    var description: String {
        return "Profile(\"\(nickname)\", \(status))"
    }

    
    func findOpponent() -> Profile? {
        return playerActionDelegate?.findOpponent(player: self)
    }
    
}
