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

//MARK: - Finding Elements

// func contains(where: (Self.Element) throws -> Bool) rethrows -> Bool
enum HTTPResponse {
    case ok
    case error(Int)
}

let lastThreeResponse: [HTTPResponse] = [.ok, .ok, .error(404)]
let hadError = lastThreeResponse.contains { element in
    if case .error = element {
        return true
    } else {
        return false
    }
}

print(hadError) // true

// func allSatisfy((Self.Element) throws -> Bool) rethrows -> Bool
let names = ["Sofia", "Camila", "Martina", "Mateo", "Nicolas"]
let allHaveAtLeastFive = names.allSatisfy({ $0.count >= 5 })
print(allHaveAtLeastFive) // true

// first(where:)
let numbers = [3, 7, 4, -2, 9, -6, 10, 1]
if let firstNegative = numbers.first(where: { $0 < 0 }) {
    print("The first negtive number is \(firstNegative).") // The first negtive number is -2.
}

// func firstIndex(where predicate: (Self.Element) throws -> Bool) rethrows -> Self.Index?
let students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
if let i = students.firstIndex(where: { $0.hasPrefix("A") }) {
    print("\(students[i]) stars with 'A'~~")
} // Abena stars with 'A'~~
// last, lastIndex는 조건에 만족되는 것 중 가장 마지막순서인 것

// func min() -> Self.Element

let height = [67.5, 65.7, 64.3, 61.1, 58.5]
let lowestHeight = height.min()
print(lowestHeight) // Optional(58.5)

// min(by:)
// @warn_unqualified_access func min(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?
let hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
let leastHue = hues.min { a, b in a.value < b.value }
print(leastHue) // Optional((key: "Coral", value: 16))

//max도 똑같이 해줌

//MARK: -Selecting Elements

// func prefix(_ maxLength: Int) -> Self.SubSequence
let numbers = [1, 2, 3, 4, 5]
print(numbers.prefix(2)) // [1, 2]
print(numbers.prefix(10)) // [1, 2, 3, 4, 5]

// func prefix(through position: Self.Index) -> Self.SubSequence

if let i = numbers.firstIndex(of: 4) {
    print(numbers.prefix(through: i))
} // [1, 2, 3, 4]

if let i = numbers.firstIndex(of: 3) {
    print(numbers[...i])
} // [1, 2, 3]

// func prefix(upTo end: Self.Index) -> Self.SubSequence
if let i = numbers.firstIndex(of: 3){
    print(numbers.prefix(upTo: i))
} // [1, 2]

print(numbers.prefix(upTo: numbers.startIndex)) // []

// func prefix(while predicate: (Self.Element) throws -> Bool) rethrows -> Self.SubSequence
// 배열의 요소가 함수여야하나. 함수가 참이면 시퀀스를 반환?

// func suffix(_ maxLength: Int) -> Self.SubSequence
print(numbers.suffix(2)) // [4, 5]

// func suffix(from start: Self.Index) -> Self.SubSequence
if let i = numbers.firstIndex(of: 3) {
    print(numbers.suffix(from: i)) // [3, 4, 5]
}

print(numbers.suffix(from: numbers.endIndex)) // []

//MARK: - Excluding Elements

// func dropFirst(_ k: Int = 1) -> Self.SubSequence
let numbers = [1, 2, 3, 4, 5]
print(numbers.dropFirst(2))
// [3, 4, 5]
print(numbers) // [1, 2, 3, 4, 5]
print(numbers.dropFirst(10)) // []

print(numbers.dropLast()) // [1, 2, 3, 4]
print(numbers.dropLast(2)) // [1, 2, 3]
print(numbers.dropLast(10)) // []

//MARK: - Transforming an Array
// 노션에 정리
//MARK: - Iterating Over an Array’s Elements

// func enumerated() -> EnumeratedSequence<Self>

for (n, c) in "Swift".enumerated() {
    print("\(n): '\(c)'")
}
/*
 0: 'S'
 1: 'w'
 2: 'i'
 3: 'f'
 4: 't'
 */

//MARK: - Reordering an Array’s Elements

// mutating func sort()
var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
var a = students.sort()
print(a) // ()
print(students) // ["Abena", "Akosua", "Kofi", "Kweku", "Peter"]

students.sort(by: >)
print(students) // ["Peter", "Kweku", "Kofi", "Akosua", "Abena"]

// mutating func sort(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows

enum HTTPResponse {
    case ok
    case error(Int)
}

var responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
var b = responses.sort {

    switch ($0, $1) {
    case let (.error(aCode), .error(bCode)):
        return aCode < bCode

    case (.ok, .ok): return false

    case (.error, .ok): return true
    case (.ok, .error): return false
    }
}

print(responses)
print(b) // ()

// func sorted() -> [Self.Element]
let sortedStudents = students.sorted()
print(sortedStudents) // ["Abena", "Akosua", "Kofi", "Kweku", "Peter"]

let descendingStudents = students.sorted(by: >)
print(descendingStudents) // ["Peter", "Kweku", "Kofi", "Akosua", "Abena"]

// func sorted(by areInIncreasingOrder: (Self.Element, Self.Element) throws -> Bool) rethrows -> [Self.Element]
let Aresponses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
let sortedResponses = responses.sorted {
    switch ($0, $1) {
    case let (.error(ACode), .error(BCode)):
        return ACode < BCode

    case (.ok, .ok): return false
    case (.error, .ok): return true
    case(.ok, .error): return false
    }
}

print(sortedResponses)

// mutating func reverse()
var characters: [Character] = ["C", "a", "f", "e"]
var a = characters.reverse()
print(a) // ()
print(characters) // ["e", "f", "a", "C"]

// func reversed() -> ReversedCollection<Self>
let word = "BackWards"
for char in word.reversed() {
    print(char, terminator: "")
} // 아예 reverse를 쓸수 없음 에러남, 어딘가에 담아서 사용해야하는 경우에는 그냥 reversed를 사용하자

let reversedWord = String(word.reversed())
print(reversedWord) // sdraWkcaB

// mutating func shuffle()
var name = "bangwoo"
print(name.shuffled()) // ["o", "a", "n", "w", "o", "g", "b"]
print(String(name.shuffled())) // oanbwog
var b = name.shuffled()
print(b) // ["g", "n", "o", "o", "b", "a", "w"]

var numbers = 0...9
var c = numbers.shuffled()
print(c)

var random = ["a", "b", "d", "e"]

// mutating func shuffle<T>(using generator: inout T) where T : RandomNumberGenerator
// 난수 생성기를 다르게 사용할 있음

// func shuffled() -> [Self.Element]
let numbers = 0...9
let shuffledNumbers = numbers.shuffled()
// shuffledNumbers == [1, 7, 6, 2, 8, 9, 4, 3, 5, 0]

// mutating func partition(by belongsInSecondPartition: (Self.Element) throws -> Bool) rethrows -> Self.Index
var numbers = [30, 40, 20, 30, 30, 60, 10]
let p = numbers.partition(by: { $0 > 30 })
print(numbers) // [30, 10, 20, 30, 30, 60, 40] 재정렬된 값으로 바뀜

let first = numbers[..<p]
print(first) // [30, 10, 20, 30, 30]
let second = numbers[p...]
print(second) // [60, 40]

// mutating func swapAt(
// _ i: Self.Index,
// _ j: Self.Index
// )

numbers.swapAt(0, 1) // 이 자체를 프린트하면 빈 튜플만 나옴
print(numbers) // [10, 30, 20, 30, 30, 60, 40]

// MARK: - Splitting and Joining Elements

/*
 func split(
     separator: Self.Element,
     maxSplits: Int = Int.max,
     omittingEmptySubsequences: Bool = true
 ) -> [Self.SubSequence]
*/

let line = "BLANCHE:  I don't want realism. I want magic!"
print(line.split(separator: " ")) // \["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]

print(line.split(separator: " ", maxSplits: 1)) // ["BLANCHE:", " I don\'t want realism. I want magic!"]
var a = line.split(separator: " ", maxSplits: 1) // var a: [String.SubSequence]

print(line.split(separator: " ", omittingEmptySubsequences: false))
// ["BLANCHE:", "", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]

// split(maxSplits:omittingEmptySubsequences:whereSeparator:)

print(line.split(whereSeparator: { $0 == " " }))
// ["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]
print(line.split(maxSplits: 1, whereSeparator: { $0 == "w" }))
// ["BLANCHE:  I don\'t ", "ant realism. I want magic!"]

// func joined() -> FlattenSequence<Self>

let ranges = [0..<3, 8..<10, 15..<17]

for range in ranges {
    print(range)
}

for index in ranges.joined() {
    print(index)
}
/*
 0
 1
 2
 8
 9
 15
 16
 */
// 이들을 다 이어 붙여서 출력하고 싶으면 terminater을 사용해주면 됨

print(ranges.joined())
// FlattenSequence<Array<Range<Int>>>(_base: [Range(0..<3), Range(8..<10), Range(15..<17)])

// func joined<Separator>(separator: Separator) -> JoinedSequence<Self> where Separator : Sequence, Separator.Element == Self.Element.Element
let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let joined = nestedNumbers.joined(separator: [-1, -2])
print(Array(joined)) // [1, 2, 3, -1, -2, 4, 5, 6, -1, -2, 7, 8, 9] 위에 처럼 joined되는 동작 자체가 출력될 수 있으니 배열에 담는것임

// func joined(separator: String = "") -> String
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let list = cast.joined(separator: ",")
print(list) // Vivien,Marlon,Kim,Karl

//MARK: - Creating and Applying Differences

let alpha1 = ["a", "b", "c"]
let alpha2 = ["d", "e", "f"]
let diff = alpha1.difference(from: alpha2, by: <)
for i in diff {
    print(i)
}
