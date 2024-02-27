//
//  Errors.swift
//  quest3
//
//  Created by Gemma Emery on 1/24/24.
//

enum ProramError : Error {
    case wrongDataLength(message : String)
    case wrongCoordinates(message : String)
    case wrongDataFormat(message : String)
}
