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
