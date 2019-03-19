//
//  Team.swift
//  nlfStandings
//
//  Created by Aaron on 1/14/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

enum TeamType: Int {
    
    // case for selecting the division of a specific team, afcEast starts at 0
    case afcEast = 0
    case afcNorth
    case afcSouth
    case afcWest
    case nfcEast
    case nfcNorth
    case nfcSouth
    case nfcWest
    
    // creation of table subheadings based on division
    var teamDivision: String {
        switch self {
        case .afcEast:
            return "AFC East"
        case .afcNorth:
            return "AFC North"
        case .afcSouth:
            return "AFC South"
        case .afcWest:
            return "AFC West"
        case .nfcEast:
            return "NFC East"
        case .nfcNorth:
            return "NFC North"
        case .nfcSouth:
            return "NFC South"
        case .nfcWest:
            return "NFC West"
        }
    }
}

// team struct, contans the team name, logo, amount of wins, losses, and ties
struct Team {
    
    let teamName: String
    let wins: String
    let losses: String
    let ties: String
    let logo: UIImage?
}

// extension of the team struct that turns the wins, losses, and ties into a single record
extension Team {
    
    var record: String {
        return "\(wins)-\(losses)-\(ties)"
    }
}
