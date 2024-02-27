//
//  main.swift
//  Number masking
//
//  Created by Gemma Emery on 2/27/24.
//

extension String {
    var maskNumber: String {
        var toProcess : String
        if (self.count == 11 && (self.starts(with: "7") || self.starts(with: "8"))) {
            toProcess = String(self.suffix(10))
        } else if (self.count == 12 && self.starts(with: "+7")) {
            toProcess = String(self.suffix(10))
        } else {
            return self
        }
        if (toProcess.starts(with: "800")) {
            return String("8 (\(toProcess.prefix(3))) \(toProcess.suffix(7).prefix(3)) \(toProcess.suffix(4).prefix(2)) \(toProcess.suffix(2))")
        } else {
            return String("+7 \(toProcess.prefix(3)) \(toProcess.suffix(7).prefix(3))-\(toProcess.suffix(4).prefix(2))-\(toProcess.suffix(2))")
        }
    }
}
