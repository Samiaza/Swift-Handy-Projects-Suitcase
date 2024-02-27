//
//  main.swift
//  Crop circles
//
//  Created by Gemma Emery on 2/27/24.
//

import Foundation

var nums : [Float80] = [0, 0, 0, 0, 0, 0]

for i in 0..<nums.count {
    var tmp : Float80? = nil
    while (tmp == nil) {
        let numStr = readLine() ?? ""
        tmp = Float80(numStr)
        if (tmp == nil) {
            print("Couldn't parse a number. Please, try again")}
        }
    nums[i] = tmp!;
}

print()

let distanceBetweenCenters = sqrt(powl(nums[0] - nums[3], 2) + powl(nums[1] - nums[4], 2))

if ( distanceBetweenCenters < abs(nums[2] - nums[5])) {
    print("One circle is inside another")
} else if ( distanceBetweenCenters <= nums[2] + nums[5]) {
    print("The circles intersect")
    let xRelative = nums[3] - nums[0]
    let yRelative = nums[4] - nums[1]
    let ceta = (powl(nums[2], 2) + powl(xRelative, 2) + powl(yRelative, 2) - powl(nums[5], 2)) / 2
    
    if (xRelative == 0) {
        let yIntersect = ceta  / yRelative
        let xIntersect1 = sqrt(powl(nums[2], 2) - powl(yIntersect - nums[1], 2)) + nums[0]
        let xIntersect2 = -sqrt(powl(nums[2], 2) - powl(yIntersect - nums[1], 2)) + nums[0]
        if (xIntersect1 == xIntersect2) {
            print("[[\(xIntersect1), \(yIntersect)]]")
        } else {
            print("[[\(xIntersect1), \(yIntersect)], [\(xIntersect2), \(yIntersect)]]")
        }
    } else if (yRelative == 0) {
        let xIntersect = ceta / xRelative
        let yIntersect1 = sqrt(powl(nums[2], 2) - powl(xIntersect - nums[0], 2)) + nums[1]
        let yIntersect2 = -sqrt(powl(nums[2], 2) - powl(xIntersect - nums[0], 2)) + nums[1]
        if (yIntersect1 == yIntersect2) {
            print("[[\(xIntersect), \(yIntersect1)]]")
        } else {
            print("[[\(xIntersect), \(yIntersect1)], [\(xIntersect), \(yIntersect2)]]")
        }
    } else {
        let alpha = powl(xRelative, 2) + powl(yRelative, 2)
        let beta = -2 * yRelative * ceta
        let eta = powl(ceta, 2) - powl(nums[2], 2) * powl(xRelative, 2)
        let diskriminant = powl(beta, 2) - 4 * alpha * eta
        print(diskriminant)
        if (diskriminant == 0) {
            let yIntersect = -beta  / (2 * alpha)
            let xIntersect = (ceta - yIntersect * yRelative) / xRelative
            print("[[\(xIntersect), \(yIntersect)]]")
        } else if (diskriminant > 0) {
            let yIntersect1 = (-beta + sqrt(diskriminant)) / (2 * alpha)
            let yIntersect2 = (-beta - sqrt(diskriminant)) / (2 * alpha)
            let xIntersect1 = (ceta - yIntersect1 * yRelative) / xRelative
            let xIntersect2 = (ceta - yIntersect2 * yRelative) / xRelative
            print("[[\(xIntersect1), \(yIntersect1)], [\(xIntersect2), \(yIntersect2)]]")
        }
    }
} else {
    print("The circles is not intersect")
}
