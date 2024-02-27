//
//  Zone.swift
//  quest3
//
//  Created by Gemma Emery on 1/24/24.
//

class Zone {
    let shape : Shape
    let phone : String
    let name : String
    let departmentCode : String
    var dangerLevel : Level
    
    init (shape : Shape, phone : String, name : String, departmentCode : String, dangerLevel : Level) {
        self.shape = shape
        self.phone = phone
        self.name = name
        self.departmentCode = departmentCode
        self.dangerLevel = dangerLevel
    }
    
    func isThisMyAccident(x: Int, y: Int) -> Bool {
        return shape.isThisMyPoint(x: x, y: y)
    }
}
