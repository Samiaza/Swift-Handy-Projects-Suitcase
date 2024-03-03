//
//  DTO.swift
//  quest1
//
//  Created by Gemma Emery on 02-03-2024.
//

import Foundation

struct FlightsData: Codable {
    let fligths: [Flight]
    
    enum CodingKeys: String, CodingKey {
        case fligths = "response"
    }
}

struct Flight: Codable {
    let hex, regNumber: String
        let flag: String
        let lat, lng: Double
        let alt: Int?
        let dir: Double
        let speed: Int
        let vSpeed: Int?
        let flightNumber, flightIcao, flightIata, depIcao: String
        let depIata, arrIcao, arrIata: String
        let airlineIcao: String
        let airlineIata: String
        let aircraftIcao: String
        let updated: Int
        let status: String
        let type: String
        let squawk: String?

        enum CodingKeys: String, CodingKey {
            case hex
            case regNumber = "reg_number"
            case flag, lat, lng, alt, dir, speed
            case vSpeed = "v_speed"
            case flightNumber = "flight_number"
            case flightIcao = "flight_icao"
            case flightIata = "flight_iata"
            case depIcao = "dep_icao"
            case depIata = "dep_iata"
            case arrIcao = "arr_icao"
            case arrIata = "arr_iata"
            case airlineIcao = "airline_icao"
            case airlineIata = "airline_iata"
            case aircraftIcao = "aircraft_icao"
            case updated, status, type, squawk
        }
}
