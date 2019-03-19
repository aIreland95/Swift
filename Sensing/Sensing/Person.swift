//
//  Person.swift
//  Sensing
//
//  Created by Aaron on 1/9/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

struct Person: Nameable {

    var firstName: String
    let lastName: String
    let pet: Pet?
    
    func speak() -> String {
        return "Hello, my name is \(firstName) \(lastName)"
    }
}

extension Person: Sensing {
    
    func see() -> String {
        return "Stare into the abyss"
    }
    
    func hear() -> String {
        return "Puts hand on chin and \(see())"
    }
    
    func taste() -> String {
        return "Oooh, that's my favorite!"
    }
    
    func touch() -> String {
        return "Pick it up"
    }
    
    func smell() -> String {
        return "What's that smell?"
    }
}
