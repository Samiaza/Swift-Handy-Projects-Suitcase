//
//  BaristaMachine.swift
//  quest2
//
//  Created by Gemma Emery on 1/31/24.
//

import Foundation

class BaristaMachine :IBarista {
    let name: String
    let portionTime: Int
    
    init?(name: String, portionTime: Int) {
        self.name = name
        self.portionTime = portionTime
    }
    
    func brew(_ order: Coffee) -> Coffee {
        print("Coffee is brewing. \(portionTime) minute - time left")
        return order
    }
    
    func description() -> String! {
        return "Machine: \"\(self.name)\", time to brew - \(portionTime) min"
    }

}
