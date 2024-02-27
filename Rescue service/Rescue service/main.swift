//
//  main.swift
//  Rescue service
//
//  Created by Gemma Emery on 2/27/24.
//

import Foundation

let districtOne = Zone(shape: Circle(x: 7, y: 7, r: 1), phone: "89347362826", name: "Sovetsky district", departmentCode: "49324", dangerLevel: Level.LOW)
let districtTwo = Zone(shape: Triangular(x1: 11, y1: 11, x2: 12, y2: 12, x3: 12, y3: 11), phone: "89347364678", name: "Kalinisky district", departmentCode: "50435", dangerLevel: Level.MIDDLE)
let city = City(name: "Novosibirsk", phone: "88008473824", districts: [districtOne, districtTwo])

print("Enter an accident coordinates:")
let accidentCoordsStr = readLine() ?? ""
let accidentCoordsStrSplitted = accidentCoordsStr.split(separator: ";")
if (accidentCoordsStrSplitted.count != 2) {
    throw ProramError.wrongDataLength(message: "Wrong data length")
}
let accidentX = Int(accidentCoordsStrSplitted[0])
let accidentY = Int(accidentCoordsStrSplitted[1])
if (accidentX == nil || accidentY == nil) {
    throw ProramError.wrongCoordinates(message: "Wrong coordinates")
}

let accident = Accident(x: accidentX!, y: accidentY!, description: "the woman said her cat can't get off the tree", applicant: "+74832648573", type: AccidentType.CAT)

print()
print("The city info:")
print("\tName: \(city.name)")
print("\tThe common number: \(city.phone.maskNumber)")

print()
print("The accident info:")
print("\tDescription: \(accident.description)")
print("\tPhone number: \(accident.applicant!.maskNumber)")
print("\tType: \(accident.type!.rawValue)")
print()

let matchedZone = city.districts.first(where: { $0.isThisMyAccident(x: accident.x, y: accident.y)})

let finalZone : Zone

if (matchedZone == nil) {
    finalZone = city.getNearestDistrict(x: accident.x, y: accident.y)
    print("The accident didn't match with any zone. The nearest zone: \(finalZone.name)")
} else {
    finalZone = matchedZone!
    print("The accident matched with zone: \(finalZone.name)")
}

print("The zone info:")
print("\tThe shape of area: \(finalZone.shape.getShape())")
print("\tPhone number: \(finalZone.phone.maskNumber)")
print("\tName: \(finalZone.name)")
print("\tEmergency dept: \(finalZone.departmentCode)")
print("\tDanger level: \(finalZone.dangerLevel.rawValue)")
print()
