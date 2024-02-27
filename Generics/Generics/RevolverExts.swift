//
//  RevolverExts.swift
//  quest1
//
//  Created by Gemma Emery on 1/26/24.
//

extension Revolver {
    func toStringDescription() -> String {
        var tmp = "Structure: \(type(of: self))\n"
        tmp.append("Objects: [")
        self[0] == nil ? tmp.append("nil, ") : tmp.append("\(self[0]!), ")
        self[1] == nil ? tmp.append("nil, ") : tmp.append("\(self[1]!), ")
        self[2] == nil ? tmp.append("nil, ") : tmp.append("\(self[2]!), ")
        self[3] == nil ? tmp.append("nil, ") : tmp.append("\(self[3]!), ")
        self[4] == nil ? tmp.append("nil, ") : tmp.append("\(self[4]!), ")
        self[5] == nil ? tmp.append("nil]\n") : tmp.append("\(self[5]!)]\n")
        tmp.append("Pointer: ")
        self[0] == nil ? tmp.append("nil") : tmp.append("\(self[0]!)")
        return tmp
    }
}
