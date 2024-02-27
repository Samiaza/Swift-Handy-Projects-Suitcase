//
//  Accident.swift
//  quest3
//
//  Created by Gemma Emery on 1/24/24.
//

enum Level : String {
    case LOW = "low"
    case MIDDLE = "middle"
    case HIGH = "high"
}

enum AccidentType: String {
    case FIRE = "Fire"
    case GAS = "Gas leak"
    case CAT = "Cat on the tree"
}

struct Accident {
    let x: Int
    let y: Int
    let description: String
    let applicant : String?
    let type : AccidentType?
}
