//
//  Revolver.swift
//  quest1
//
//  Created by Gemma Emery on 1/26/24.
//

import Foundation

class Revolver<T: Equatable> {
    private var clip : Array<T?> = [nil, nil, nil, nil, nil, nil]
    var pointer: T? {
        get{
            return clip[0]
        }
    }
    
    init(o1: T, o2: T, o3: T, o4: T, o5: T, o6: T) {
        clip = [o1, o2, o3, o4, o5, o6]
    }
    
    init(arr : Array<T?>) {
        clip = arr
    }
    
    func add(arg: T) -> Bool {
        let pos = findFirstEmpty()
        if pos == -1 {
            return false
        } else {
            clip[pos] = arg
            return true
        }
    }
    
    func add(arr: Array<T>) -> Bool {
        if (arr.isEmpty || self.isFull) {
            return false
        }
        for elem in arr {
            _ = add(arg: elem)
            if self.isFull {
                break
            }
        }
        return true
    }
    
    func shoot() -> T? {
        let bullet = clip.removeFirst()
        clip.append(nil)
        return bullet
    }
    
    func unloadAll() -> Array<T?> {
        let all = clip
        clip = [nil, nil, nil, nil, nil, nil]
        return all
    }
    
    func unload(index: Int) -> T? {
        let bullet = clip[index]
        clip[index] = nil
        return bullet
    }
    
    func scroll() {
        let shiftVal = Int.random(in: 1...5)
        for _ in 1...shiftVal {
            shift()
        }
    }
    
    func getSize() -> Int {
        var count = 0
        clip.forEach({if $0 != nil {count += 1}})
        return count
    }
    
    static func == (lhs: Revolver, rhs: Revolver) -> Bool {
        var res : Bool = false
        for _ in 1...6 {
            rhs.shift()
            res = res || (lhs.clip == rhs.clip)
        }
        return res
    }
    
    subscript(index: Int) -> T? {
        get{
            return clip[index]
        }
    }
    
    var isEmpty : Bool {
        get {
            for bullet in clip {
                if bullet != nil {
                    return false
                }
            }
            return true
        }
    }
    
    var isFull : Bool {
        get {
            for bullet in clip {
                if bullet == nil {
                    return false
                }
            }
            return true
        }
    }
    
    private func findFirstEmpty() -> Int {
        var tmp = 0
        while tmp < clip.count {
            if (clip[tmp] == nil) {
                return tmp
            }
            tmp += 1
        }
        return -1
    }
    
    private func shift() {
        let bullet = clip.removeFirst()
        clip.append(bullet)
    }
}
