//
//  main.swift
//  Return to source
//
//  Created by Gemma Emery on 2/27/24.
//

import Foundation

var coffeeOne = Coffee(name: "Capuccino", andPrice: 2)
var coffeeTwo = Coffee(name: "Americano", andPrice: 1.5)
var coffeeThree = Coffee(name: "Latte", andPrice: 2.3)

var menu = [coffeeOne!, coffeeTwo!, coffeeThree!]

var barman = Barista(name: "Ivan", andLastname: "Divov", andExperience: 15)
var barbot = BaristaMachine(name: "Zanussi", portionTime: 2)

var executors : Array<IBarista> = []
executors.append(barman!)
executors.append(barbot!)

print("Choose barista:")
executors.enumerated().forEach({print("\($0 + 1). \($1.description()!)")})
print()

let execNum = getNumber(from: 1, to: executors.count)
print()

if executors[execNum - 1] is BaristaMachine {
    for i in 0..<menu.count {
        let prevPrice = menu[i].value(forKey: "price")!
        let name = menu[i].value(forKey: "name")!
        menu[i] = Coffee(name: (name as! String), andPrice: prevPrice as! Float * 0.9)
    }
}

print("Choose coffee in menu:")
menu.enumerated().forEach({print("\($0 + 1). \($1.value(forKey: "name")!) \($1.value(forKey: "price")!)$")})
print()

let menuNum = getNumber(from: 1, to: menu.count)
print()

let brewed = executors[execNum - 1].brew(menu[menuNum - 1])

print("Your \(brewed!.value(forKey: "name")!) is ready!")

func getNumber(from:Int, to:Int) -> Int {
    var tmp : Int? = nil
    while (tmp == nil) {
        let numStr = readLine() ?? ""
        tmp = Int(numStr)
        if (tmp == nil || tmp! < from || tmp! > to) {
            print("Something went wrong. Please, try again:")
            tmp = nil
        }
    }
    return tmp!
}
