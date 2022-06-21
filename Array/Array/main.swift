//
//  main.swift
//  Array
//
//  Created by 방선우 on 2022/06/21.
//

import Foundation

//// MARK: - Inspecting an Array
//var students = ["Ben", "Ivt", "Jordell"]
//print(students.capacity) // 3
//
//// MARK: - Accessing Elements
//
//// first, last
//let numbers = [10, 20, 30, 40 ,50]
//if let firstNumber = numbers.first, let lastNumber = numbers.last {
//    print(firstNumber, lastNumber, separator: "🍰")
//} // 10🍰50
//
//// subscript(Range<Int>) -> ArraySlice<Element>
//let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
//let streetSlice = streets[2..<streets.endIndex] // 인덱스를 적어주는 곳에 범위를 작성할 수 있음
//print(streetSlice) // ["Channing", "Douglas", "Evarts"]
//
//let i = streetSlice.firstIndex(of: "Evarts")
//print(i) // Optional(4)
//print(streets[i!]) // Evarts
//
//// func randomElement() -> Self.Element?
//print(streets.randomElement()!) // Channing

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
