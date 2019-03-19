//
//  Weasel.swift
//  Sensing
//
//  Created by Aaron on 1/9/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

struct Weasel: Pet {

    var firstName: String
    let lastName: String
    
}

extension Weasel: Sensing {
    func speak() -> String {
        return "Squeak squeak squeak"
    }
    
    func see() -> String {
        return "Run away frightened"
    }
    
    func hear() -> String {
        return "No response"
    }
    
    func taste() -> String {
        return "nom nom"
    }
    
    func touch() -> String {
        return "They just bite"
    }
    
    func smell() -> String {
        return "Smell themselves"
    }
    
}
