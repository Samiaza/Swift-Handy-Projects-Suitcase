//
//  Shape.swift
//  quest3
//
//  Created by Gemma Emery on 1/24/24.
//

import Foundation

protocol Shape {
    func isThisMyPoint(x: Int, y: Int) -> Bool
    func getShape() -> String
    func getDistanceTo(x: Int, y: Int) -> Double
}

class Circle : Shape {
    let xCenter : Int
    let yCenter : Int
    let radius : Int
    init(x: Int, y: Int, r: Int) {
        xCenter = x
        yCenter = y
        radius = r
    }
    func isThisMyPoint(x: Int, y: Int) -> Bool {
        return sqrt(pow(CGFloat(x - xCenter), 2) + pow(CGFloat(y - yCenter), 2)) <= CGFloat(radius)
    }
    func getShape() -> String {
        return "circle"
    }
    func getDistanceTo(x: Int, y: Int) -> Double {
        let distToCenter = sqrt(pow(CGFloat(x - xCenter), 2) + pow(CGFloat(y - yCenter), 2))
        return distToCenter > CGFloat(radius) ? distToCenter - CGFloat(radius) : 0
    }
}

class Triangular : Shape {
    
    let x1 : Int
    let y1 : Int
    let x2 : Int
    let y2 : Int
    let x3 : Int
    let y3 : Int
    init(x1 : Int, y1 : Int, x2 : Int, y2 : Int, x3 : Int, y3 : Int) {
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        self.x3 = x3
        self.y3 = y3
    }
    func isThisMyPoint(x: Int, y: Int) -> Bool {
        return getTriangleSquare(x1: x1, y1: y1, x2: x2, y2: y2, x3: x3, y3: y3) >= getTriangleSquare(x1: x, y1: y, x2: x2, y2: y2, x3: x3, y3: y3) + getTriangleSquare(x1: x1, y1: y1, x2: x, y2: y, x3: x3, y3: y3) + getTriangleSquare(x1: x1, y1: y1, x2: x2, y2: y2, x3: x, y3: y)
    }
    func getShape() -> String {
        return "triangular"
    }
    func getDistanceTo(x: Int, y: Int) -> Double {
        return [distancePointSegment(x: x, y: y, x1: x1, y1: y1, x2: x2, y2: y2),
                distancePointSegment(x: x, y: y, x1: x1, y1: y1, x2: x3, y2: y3),
                distancePointSegment(x: x, y: y, x1: x2, y1: y2, x2: x3, y2: y3)].min()!
    }
}

func getTriangleSquare(x1 : Int, y1 : Int, x2 : Int, y2 : Int, x3 : Int, y3 : Int) -> Double {
    let lengthOne = sqrt(pow(CGFloat(x1 - x2), 2) + pow(CGFloat(y1 - y2), 2))
    let lengthTwo = sqrt(pow(CGFloat(x1 - x3), 2) + pow(CGFloat(y1 - y3), 2))
    let lengthThree = sqrt(pow(CGFloat(x3 - x2), 2) + pow(CGFloat(y3 - y2), 2))
    let semiperimeter = (lengthOne + lengthTwo + lengthThree) / 2
    return sqrt(semiperimeter * (semiperimeter - lengthOne) * (semiperimeter - lengthTwo) * (semiperimeter - lengthThree))
}

func distance(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
    return sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
}

func distancePointSegment(x: Int, y: Int, x1: Int, y1: Int, x2: Int, y2: Int) -> Double {
    let r1 = distance(x1: Double(x), y1: Double(y), x2: Double(x1), y2: Double(y1))
    let r2 = distance(x1: Double(x), y1: Double(y), x2: Double(x2), y2: Double(y2))
    let r12 = distance(x1: Double(x1), y1: Double(y1), x2: Double(x2), y2: Double(y2))
    if (r1 >= distance(x1: r2, y1: r12, x2: 0, y2: 0)) {
        return r2
    } else if (r2 >= distance(x1: r1, y1: r12, x2: 0, y2: 0)) {
        return r1
    } else {
        var a = y2 - y1
        var b = x1 - x2
        var c = -x1 * a - b * y1
        let t = distance(x1: Double(a), y1: Double(b), x2: 0, y2: 0)
        if (c > 0) {
            a = -a
            b = -b
            c = -c
        }
        return Double((a * x + b * y + c)) / t
    }
}
