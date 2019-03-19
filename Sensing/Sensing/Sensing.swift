//
//  Sensing.swift
//  Sensing
//
//  Created by Aaron on 1/9/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

protocol Sensing {

    func see() -> String
    func hear() -> String
    func taste() -> String
    func touch() -> String
    func smell() -> String
}

protocol Audible {
    
    func speak() -> String
}

protocol Nameable {
    
    var firstName: String { get set }
    var lastName: String { get }
}

extension Nameable {
    
    var fullName: String {
        
        get {
            return firstName + " " + lastName
        }
    }
}

extension Weasel: Nameable, Audible {}
extension Parrot: Nameable, Audible {}
extension Person: Audible {}

protocol Pet {
    
    func sit()
    func sleep()
    func poop()
}

extension Pet {
    
    func sit() {
        print("Sits down")
    }
    
    func sleep() {
        print("zzzzzzzz...")
    }
    
    func poop() {
        print("Does its business")
    }
}
