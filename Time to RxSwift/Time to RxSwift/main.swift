//
//  main.swift
//  Time to RxSwift
//
//  Created by Gemma Emery on 2/27/24.
//

//Task 1 Implement a function that will filter `firstCollection` and save only string with the letter `e`
//
//Task 2 Implement a function that will return the first element from the `firstCollection` beginning with `th`
//
//Task 3 Implement a function that checks if all strings from the `firstCollection` are longer than `5` characters
//
//Task 4 Implement a function that checks if there are any strings longer than `5` characters in the `firstCollection`
//
//Task 5 Implement a function that checks for empty strings in the `firstCollection`
//
//Task 6 Implement a function that counts the total length of strings in the `firstCollection`
//
//Task 7 Implement a function that counts the number of strings in the `firstCollection`
//
//Task 8 Implement a function that returns an array of strings (text fields) from the `secondCollection`
//
//Task 9 Implement a function that groups values by id in the `secondCollection`
//
//Task 10 Implement a function that groups values by id in the `secondCollection` and counts the number of elements in each group.

import Foundation
import RxSwift

// Task 1
async let filtered: [String] = filterCollectionByLetter(collection: firstCollection, letter: "e")
print("Task1: result = \(await filtered)")

//Task 2
async let finded: String? = findFirstByPrefix(collection: firstCollection, prefix: "th")
print("\nTask2: result = \"\(await finded!)\"")

//Task 3
async let allIsLonger: Bool = allStringsLongerThan(collection: firstCollection, length: 5)
print("\nTask3: result = \(await allIsLonger)")

//Task 4
async let exists: Bool = containsStringsLongerThan(collection: firstCollection, length: 5)
print("\nTask4: result = \(await exists)")

//Task 5
async let allIsNotEmpty: Bool = allStringsNotEmpty(collection: firstCollection)
print("\nTask5: result = \(await allIsNotEmpty)")

//Task 6
async let lengthOfAll: Int = allStringsLength(collection: firstCollection)
print("\nTask6: result = \(await lengthOfAll)")

//Task 7
async let numOfStrs: Int = numberOfStrings(collection: firstCollection)
print("\nTask7: result = \(await numOfStrs)")

//Task 8
async let allStrs: [String] = allStrings(collection: secondCollection)
print("\nTask8: result = \(await allStrs)")

//Task 9
async let groupedById: [[Sample]] = await groupById(collection: secondCollection)
print("\nTask9: result = \(await groupedById)")

//Task 10
async let groupedByIdAndCounted: [Pair<Int, Int>] = await groupByIdAndCount(collection: secondCollection)
print("\nTask10: result = \(await groupedByIdAndCounted)")


// Task 1
func filterCollectionByLetter(collection: Observable<String>, letter: Character) async -> [String] {
    var res: [String] = []
    collection.filter{ $0.contains(letter) }.subscribe {
        res.append($0)
    }.disposed(by: DisposeBag())
    return res
}

// Task 2
func findFirstByPrefix(collection: Observable<String>, prefix: String) async -> String? {
    var res: String?
    collection.filter{ $0.starts(with: prefix) }.first().subscribe {
        res = $0
    }.disposed(by: DisposeBag())
    return res
}

// Task 3
func allStringsLongerThan(collection: Observable<String>, length: Int) async -> Bool {
    var res: Bool = true
    collection.subscribe {str in
        res = (str.count > length) && res
    }.disposed(by: DisposeBag())
    return res
}

// Task 4
func containsStringsLongerThan(collection: Observable<String>, length: Int) async -> Bool {
    var count = 0
    collection.filter{ $0.count > length }.subscribe {str in
        count += 1
    }.disposed(by: DisposeBag())
    return count > 0 ? true : false
}

// Task 5
func allStringsNotEmpty(collection: Observable<String>) async -> Bool {
    var res: Bool = true
    collection.subscribe {str in
        res = (str.count > 0) && res
    }.disposed(by: DisposeBag())
    return res
}

// Task 6
func allStringsLength(collection: Observable<String>) async -> Int {
    var res: Int = 0
    collection.subscribe {str in
        res += str.count
    }.disposed(by: DisposeBag())
    return res
}

// Task 7
func numberOfStrings(collection: Observable<String>) async -> Int {
    var res: Int = 0
    collection.subscribe (onNext: {str in
        res += 1
    }).disposed(by: DisposeBag())
    return res
}

// Task 8
func allStrings(collection: Observable<Sample>) async -> [String] {
    var res: [String] = []
    collection.subscribe (onNext: {item in
        res.append(item.text)
    }).disposed(by: DisposeBag())
    return res
}

// Task 9
func groupById(collection: Observable<Sample>) async -> [[Sample]] {
    let disposeBag = DisposeBag()
    var res: [[Sample]] = []
    let grouped = collection.groupBy{ $0.id }
    let indexedGrouped = grouped.flatMap{ Observable.combineLatest( Observable.just($0.key), $0.toArray().asObservable()) }
    let unindexedArrayed = indexedGrouped.map { groupedSamples in
            groupedSamples.1
        }
    unindexedArrayed.subscribe(onNext: { arr in
            res.append(arr)
            }).disposed(by: disposeBag)
    return res
}

// Task 10
func groupByIdAndCount(collection: Observable<Sample>) async -> [Pair<Int, Int>] {
    let disposeBag = DisposeBag()
    var res: [Pair<Int, Int>] = []
    let grouped = collection.groupBy{ $0.id }
    let indexedGrouped = grouped.flatMap{ Observable.combineLatest( Observable.just($0.key), $0.toArray().asObservable()) }
    indexedGrouped.subscribe(onNext: { ind, arr in
        res.append(Pair(first: ind, second: arr.count))
            }).disposed(by: disposeBag)
    return res
}

struct Pair<T1, T2> {
    let first: T1
    let second: T2
}
