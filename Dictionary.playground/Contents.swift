import UIKit

var otherInts = Dictionary<Int, String>() // [Int : String]()
otherInts = [Int : String]()

otherInts = [2: "two", 4: "four"]


// inserting values
otherInts[1] = "one"
otherInts[3] = "three"
otherInts[8] = "eight"
otherInts[100] = "one hundred"


// accessing dictionaries
let one = otherInts[1]


// nil entries

if let two = otherInts[2] {
    print(two)
}
if let five = otherInts[5] {
    print(five)
}
if let _ = otherInts[7] {
    print("nothing")
}


// updating values
otherInts[1] = "uno"


// iterating

for (key, value) in otherInts {
    print("key \(key), value \(value)")
}

for pair in otherInts {
    print("\(pair.key) + \(pair.value)")
    print("\(pair.0) + \(pair.1)")
}

// Student struct (name, age)

struct Student: Equatable {
    let name: String
    let age: UInt
}

// extension Student: Equatable {
//     static func ==(lhs: Student, rhs: Student) -> Bool {
//         return lhs.name == rhs.name && lhs.age == rhs.age
//     }
// }

// make students

let spencer = Student.init(name: "Spencer", age: 15)
let hutch = Student.init(name: "Hutch", age: 17)
let lev = Student.init(name:"Lev", age: 29)
let aaron = Student.init(name:"Aaron", age: 23)
let aaron2 = Student.init(name:"Aaron", age: 25)

let same = spencer == aaron
let same2 = aaron == aaron2

// var classes = [String : [Student]]()

var classes = [String : [Student]]()

classes["ios"] = [spencer, hutch, lev, aaron]
classes["math"] = []
classes["english"] = [lev, aaron]
classes["home ec"] = [hutch, aaron]
classes["gym"] = [spencer, hutch, aaron2]

// extension to find all classes for a student

extension Dictionary where Key == String, Value == [Student] {
    
    func classes(for student: Student) -> [String] {
        
        var classes = [String]()
        
        for (className, students) in self {
            
            if students.contains(student) {
                classes.append(className)
            }
        }
        
        return classes
    }
    
}

classes.classes(for: hutch)
classes.classes(for: aaron)
classes.classes(for: spencer)
classes.classes(for: lev)


// You're given an array of integers. Find the frequency of each integer.
// The frequency is the number of times it appears in the array.
// Print the numbers in ascending order followed by their frequency

var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]

var frequency = [Int: Int]()

for number in numbers {
    if var freq = frequency[number] {
        freq += 1
        frequency[number] = freq
    }
    else {
        frequency[number] = 1
    }
}

for number in frequency.keys.sorted() {
    let freq = frequency[number]!
    print("\(number) : \(freq)")
}

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

var json = [String : Any]()

json["frequency"] = 3
json["student"] = Student(name: "Bob", age: 20)
json["toppings"] = ["cheese", "bacon", "pineapples"]
json["json"] = json

if let number = json["frequency"] as? Int {
    
    number + 10
}

if let student = json["student"] as? Student {
    
    student.name
}

if let toppings = json["toppings"] as? [String] {
    
    toppings
}

if let nestedJson = json["json"] as? [String : Any] {
    
    nestedJson
}
