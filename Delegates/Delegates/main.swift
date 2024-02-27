//
//  main.swift
//  Delegates
//
//  Created by Gemma Emery on 2/27/24.
//

import Foundation

let plOne = Profile(nick: "aboba", age: 18, name: "Ivan")
let plTwo = Profile(nick: "zloba", age: 28, name: "Divan")
let plThree = Profile(nick: "amyoba", age: 15, name: "Pivan")
let plFour = Profile(nick: "radoba", age: 16, name: "Suvan")
let plFive = Profile(nick: "zaboba", age: 17, name: "Vovan")

let serv = Server()

_ = serv.addPlayerProfile(player: plOne)
_ = serv.addPlayerProfile(player: plTwo)
_ = serv.addPlayerProfile(player: plThree)
_ = serv.addPlayerProfile(player: plFour)
_ = serv.addPlayerProfile(player: plFive)

serv.profiles[0].status = PlayerStatus.IDLE
serv.profiles[1].status = PlayerStatus.SEARCH
serv.profiles[2].status = PlayerStatus.IN_PLAY
serv.profiles[3].status = PlayerStatus.IN_PLAY
serv.profiles[4].status = PlayerStatus.SEARCH

let plMyself = Profile(nick: "nagibator90000", age: 18, name: "Rudolph")

_ = serv.addPlayerProfile(player: plMyself)

print("Searcher profile:")
print(plMyself.description)
print()

print("Server profiles:")
print(serv.profiles.map({$0.description as AnyObject}))
print()

let opponent = plMyself.findOpponent()
print("Result search:")
print("Searcher profile:")
print(plMyself.description)
print("Opponent profile:")
print(opponent!.description)
print("Server profiles:")
print(serv.profiles.map({$0.description as AnyObject}))
print()
