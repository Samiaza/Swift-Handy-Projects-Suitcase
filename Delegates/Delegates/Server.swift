//
//  Server.swift
//  quest3
//
//  Created by Gemma Emery on 1/29/24.
//

import Foundation

protocol PlayerAction {
    func findOpponent(player: Profile) -> Profile?
}

class Server : PlayerAction {
    var profiles : Array<Profile> = []
    
    func addPlayerProfile(player : Profile) -> Bool {
        if profiles.first(where: {$0.nickname == player.nickname}) != nil {
            return false
        } else {
            player.playerActionDelegate = self
            profiles.append(player)
            return true
        }
    }
    
    func findOpponent(player: Profile) -> Profile? {
        player.status = PlayerStatus.SEARCH
        let opponent = profiles.first(where: {$0.nickname != player.nickname && $0.status == PlayerStatus.SEARCH})
        opponent?.status = PlayerStatus.IN_PLAY
        if opponent != nil { player.status = PlayerStatus.IN_PLAY }
        return opponent
    }
}
