//
//  Parrot.swift
//  Sensing
//
//  Created by Aaron on 1/9/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

struct Parrot: Pet {

    var firstName: String
    let lastName: String
    
    func sit() {
        print("Hops on branch and perches")
    }
    
}

extension Parrot: Sensing {
    func speak() -> String {
        return "Polly wants a cracker!"
    }
    
    func see() -> String {
        return "Turn head 180 degrees"
    }
    
    func hear() -> String {
        return speak()
    }
    
    func taste() -> String {
        return "Polly wants more crackers!"
    }
    
    func touch() -> String {
        return speak()
    }
    
    func smell() -> String {
        return "Flies away"
    }
    
    
}
