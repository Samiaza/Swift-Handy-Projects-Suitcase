//
//  City.swift
//  quest3
//
//  Created by Gemma Emery on 1/24/24.
//

class City {
    let name : String
    let phone : String
    let districts : Array<Zone>
    
    init (name : String, phone : String, districts : Array<Zone>) {
        self.phone = phone
        self.name = name
        self.districts = districts
    }
    
    func getNearestDistrict(x: Int, y: Int) -> Zone {
        return districts.min(by: { $0.shape.getDistanceTo(x: x, y: y) < $1.shape.getDistanceTo(x: x, y: y) })!
    }
}
