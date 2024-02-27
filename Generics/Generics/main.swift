//
//  main.swift
//  Generics
//
//  Created by Gemma Emery on 2/27/24.
//

import Foundation

let rev = Revolver<Int>(arr: [3, 54, 7, 2, 56, 4])

print("1. Adding elements")
print(rev.toStringDescription())
print()

print("2. Subscript")
print("\(rev[0]!), \(rev[5]!)")
print()

print("3. Scroll")
rev.scroll()
print(rev.toStringDescription())
print()

print("4. Deletion")
_ = rev.shoot()
_ = rev.shoot()
_ = rev.shoot()
_ = rev.shoot()
print(rev.toStringDescription())
print()

print("5. Supply collection")
let supply = [4, 6, 3, 22, 77, 43, 76, 5]
print("Before:")
print("Supply collection: \(supply)")
print(rev.toStringDescription())
print("\nAfter add operation performed:")
_ = rev.add(arr: supply)
print(rev.toStringDescription())
print()

print("6. Extraction")
let extracted = rev.unloadAll()
print("The extracted list: \(extracted)")
print("size: \(extracted.count)")
print()
print(rev.toStringDescription())
print("size: \(rev.getSize())")
print()

print("7. Supply collection 2")
let supply2 = [77, 43, 76, 5]
print("Before:")
print("Supply collection: \(supply2)")
print(rev.toStringDescription())
print("\nAfter add operation performed:")
_ = rev.add(arr: supply2)
print(rev.toStringDescription())
print()

print("8. Equals")
rev.scroll()
print(rev.toStringDescription())
print()

let rev2 = Revolver<Int>(arr: [nil, nil, 77, 43, 76, 5])
rev2.scroll()
print(rev2.toStringDescription())
print()

print("Result: \(rev == rev2 ? "equals" : "non-equals")")
print()

print("9. Non - Equals")
rev.scroll()
print(rev.toStringDescription())
print()

let rev3 = Revolver<Int>(arr: [nil, nil, 5, 76, nil, 77])
rev3.scroll()
print(rev3.toStringDescription())
print()

print("Result: \(rev == rev2 ? "equals" : "non-equals")")
