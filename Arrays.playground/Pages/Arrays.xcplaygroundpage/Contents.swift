//: Playground - noun: a place where people can play

import UIKit

// creating an array

var odds = [Int]()
odds.append(1)
odds.append(3)
odds.append(5)
odds.append(7)

var otherOdds = odds
otherOdds.append(9)
odds.append(11)

let evens = [2, 4, 6, 8]

var both = Array<Int>()
both.append(contentsOf: odds)
both = both + evens

// sorting

let newBoth = both.sorted()
both.sort()

func sortMethod(a: Int, b: Int) -> Bool {
    return b < a
}
both.sorted(by: sortMethod)

both.sorted { (a, b) -> Bool in
    return b < a
}

both.sorted { $0 > $1 }

let filtered = both.filter { $0 % 2 == 0 }
both.filter { (value) -> Bool in
    return value % 2 == 0
}
print(filtered)




// iterating

//for i = 0; i < both.count; i++ {
//    let value = both[i]
//}

for i in 0 ..< both.count {
    let value = both[i]
}

for value in both {
    print(value)
}

for (index, value) in both.enumerated() {
    print(index)
    print(value)
}


// first, last, index
let value = both.first
let firstValue = both[0]

let last = both.last
let lastValue = both[both.count - 1]

var slice = both[0 ..< min(both.count, 3)]
slice.append(3)
Array(slice)



// string array

var names = ["Jon", "Dave", "Sam", "Jen", "Jo"]
names.contains("Jon")

if let index = names.index(of: "asdf") {
    names.remove(at: index)
} else {
    print("not found")
}
names

var morenames = names
morenames.append("Seth")


extension Array {

    mutating func dropRandom() {
        guard !isEmpty else { return }
        let index = Int.random(in: 0 ..< count)
        remove(at: index)
    }

}

both.dropRandom()
names.dropRandom()

extension Array where Element == Int {

    func toString() -> [String] {
        return map(String.init)
//        return self.map { "\($0)" }

//        return self.map({ (value) -> String in
//            return "\(value)"
//        })

//        var values = [String]()
//        for value in self {
//            values.append("\(value)")
//        }
//        return values
    }

}



both.toString()


// Int only extension, add up values

// map - squares

// reduce


