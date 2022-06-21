//
//  main.swift
//  Array
//
//  Created by 방선우 on 2022/06/21.
//

import Foundation

// MARK: - Inspecting an Array
var students = ["Ben", "Ivt", "Jordell"]
print(students.capacity) // 3

// MARK: - Accessing Elements

// first, last
let numbers = [10, 20, 30, 40 ,50]
if let firstNumber = numbers.first, let lastNumber = numbers.last {
    print(firstNumber, lastNumber, separator: "🍰")
} // 10🍰50

// subscript(Range<Int>) -> ArraySlice<Element>
let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
let streetSlice = streets[2..<streets.endIndex] // 인덱스를 적어주는 곳에 범위를 작성할 수 있음
print(streetSlice) // ["Channing", "Douglas", "Evarts"]

let i = streetSlice.firstIndex(of: "Evarts")
print(i) // Optional(4)
print(streets[i!]) // Evarts

// func randomElement() -> Self.Element?
print(streets.randomElement()!) // Channing

//MARK: - Adding Elements

// insert(contentsOf:at:)
// contentsOf에는 컬렉션만 들어올 수 있다
var numbers = [1, 2, 3, 4, 5]
numbers.insert(contentsOf: [6, 7, 8], at: 3)
print(numbers) // [1, 2, 3, 6, 7, 8, 4, 5]

// replaceSubrange(_:with:)
numbers.replaceSubrange(1...3, with: repeatElement(0, count: 3))
print(numbers) // [1, 0, 0, 0, 7, 8, 4, 5]

// reserveCapacity(_:)
var values: [Int] = [0, 1, 2, 3]

//Don't use 'reserveCapacity(_:)' like this
func addTenQuadratic() {
    let newCount = values.count + 10
    values.reserveCapacity(newCount)
    for n in values.count..<newCount {
        values.append(n)
    }
} // 이렇게 메모리 공간을 미리 만들어놓지 말고 차라리 append로 요소 추가하기

// MARK: - Combining Arrays

// static func + <Other>(lhs: Other, rhs: Self) -> Self where Other : Sequence, Self.Element == Other.Element
let numbers = [7, 8, 9, 10]
let moreNumbers = (1...6) + numbers
print(moreNumbers) // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// static func += <Other>(lhs: inout Self, rhs: Other) where Other : Sequence, Self.Element == Other.Element
// 시퀀스말고 배열을 추가해 됨
var numbers = [7, 8, 9]
numbers += 10...15
print(numbers) // [7, 8, 9, 10, 11, 12, 13, 14, 15]

//MARK: - Removing Elements

// mutating func removeFirst(_ k: Int)
var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
bugs.removeFirst(3) // removeLast(_ k: Int) -> 이것도 똑같이 하면 됨
print(bugs) // ["Damselfly", "Earwig"]

// removeSubrange(_:)
// mutating func removeSubrange(_ bounds: Range<Self.Index>)
var measurements = [1.2, 1.5, 2.9, 1.2, 1.5]
measurements.removeSubrange(1..<4)
print(measurements) // [1.2, 1.5]

// removeAll(where:)
// mutating func removeAll(where shouldBeRemoved: (Self.Element) throws -> Bool) rethrows

var phrase = "I love you"
var vowel: Set<Character> = ["o", "y"]
phrase.removeAll(where: { vowel.contains($0) })
print(phrase) // I lve u

// popLast() -> 배열의 마지막 요소가 있는지 없는지 알고싶을 때
print(bugs.popLast()) // -> Optional("Earwig") 제거되는 요소를 반환하는 것
bugs.removeLast() // Earwig 제거되는 요소를 반환하는 것
