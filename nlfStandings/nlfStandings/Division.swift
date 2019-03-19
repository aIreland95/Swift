//
//  Division.swift
//  nlfStandings
//
//  Created by Aaron on 1/23/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

// division struct, contains an array of teams, divided amongst divisions, or TeamType
struct Division {
    
    let teams: [TeamType: [Team]]
}

// extension of division that appends each team into the array of teams
extension Division {
    
    static func seedData() -> Division {
        
        var teams = [TeamType : [Team]]()
        
        // AFC East
        let afcEast1 = Team(teamName: "New England Patriots", wins: "11", losses: "5", ties: "0", logo: UIImage(named: "patriots"))
        let afcEast2 = Team(teamName: "Miami Dolphins", wins: "7", losses: "9", ties: "0", logo: UIImage(named: "dolphins"))
        let afcEast3 = Team(teamName: "Buffalo Bills", wins: "6", losses: "10", ties: "0", logo: UIImage(named: "bills"))
        let afcEast4 = Team(teamName: "New York Jets", wins: "4", losses: "12", ties: "0", logo: UIImage(named: "jets"))
        
        let afcEast = [afcEast1, afcEast2, afcEast3, afcEast4]
        teams[.afcEast] = afcEast
        
        // AFC North
        let afcNorth1 = Team(teamName: "Baltimore Ravens", wins: "10", losses: "6", ties: "0", logo: UIImage(named: "ravens"))
        let afcNorth2 = Team(teamName: "Pittsburgh Steelers", wins: "9", losses: "6", ties: "1", logo: UIImage(named: "steelers"))
        let afcNorth3 = Team(teamName: "Cleveland Browns", wins: "7", losses: "8", ties: "1", logo: UIImage(named: "browns"))
        let afcNorth4 = Team(teamName: "Cincinnati Bengals", wins: "6", losses: "10", ties: "0", logo: UIImage(named: "bengals"))
        
        let afcNorth = [afcNorth1, afcNorth2, afcNorth3, afcNorth4]
        teams[.afcNorth] = afcNorth
        
        // AFC South
        let afcSouth1 = Team(teamName: "Houston Texans", wins: "11", losses: "5", ties: "0", logo: UIImage(named: "texans"))
        let afcSouth2 = Team(teamName: "Indianapolis Colts", wins: "10", losses: "6", ties: "0", logo: UIImage(named: "colts"))
        let afcSouth3 = Team(teamName: "Tennessee Titans", wins: "9", losses: "7", ties: "0", logo: UIImage(named: "titans"))
        let afcSouth4 = Team(teamName: "Jacksonville Jaguars", wins: "5", losses: "11", ties: "0", logo: UIImage(named: "jaguars"))
        
        let afcSouth = [afcSouth1, afcSouth2, afcSouth3, afcSouth4]
        teams[.afcSouth] = afcSouth
        
        // AFC West
        let afcWest1 = Team(teamName: "Kansas City Chiefs", wins: "12", losses: "4", ties: "0", logo: UIImage(named: "chiefs"))
        let afcWest2 = Team(teamName: "Los Angeles Chargers", wins: "12", losses: "4", ties: "0", logo: UIImage(named: "chargers"))
        let afcWest3 = Team(teamName: "Denver Broncos", wins: "6", losses: "10", ties: "0", logo: UIImage(named: "broncos"))
        let afcWest4 = Team(teamName: "Oakland Raiders", wins: "4", losses: "12", ties: "0", logo: UIImage(named: "raiders"))
        
        let afcWest = [afcWest1, afcWest2, afcWest3, afcWest4]
        teams[.afcWest] = afcWest
        
        // NFC East
        let nfcEast1 = Team(teamName: "Dallas Cowboys", wins: "10", losses: "6", ties: "0", logo: UIImage(named: "cowboys"))
        let nfcEast2 = Team(teamName: "Philadelphia Eagles", wins: "9", losses: "7", ties: "0", logo: UIImage(named: "eagles"))
        let nfcEast3 = Team(teamName: "Washington Redskins", wins: "7", losses: "9", ties: "0", logo: UIImage(named: "redskins"))
        let nfcEast4 = Team(teamName: "New York Giants", wins: "5", losses: "11", ties: "0", logo: UIImage(named: "giants"))
        
        let nfcEast = [nfcEast1, nfcEast2, nfcEast3, nfcEast4]
        teams[.nfcEast] = nfcEast
        
        // NFC North
        let nfcNorth1 = Team(teamName: "Chicago Bears", wins: "12", losses: "4", ties: "0", logo: UIImage(named: "bears"))
        let nfcNorth2 = Team(teamName: "Minnesota Vikings", wins: "8", losses: "7", ties: "1", logo: UIImage(named: "vikings"))
        let nfcNorth3 = Team(teamName: "Green Bay Packers", wins: "6", losses: "9", ties: "1", logo: UIImage(named: "packers"))
        let nfcNorth4 = Team(teamName: "Detroit Lions", wins: "6", losses: "10", ties: "0", logo: UIImage(named: "lions"))
        
        let nfcNorth = [nfcNorth1, nfcNorth2, nfcNorth3, nfcNorth4]
        teams[.nfcNorth] = nfcNorth
        
        // NFC South
        let nfcSouth1 = Team(teamName: "New Orleans Saints", wins: "13", losses: "3", ties: "0", logo: UIImage(named: "saints"))
        let nfcSouth2 = Team(teamName: "Atlanta Falcons", wins: "7", losses: "9", ties: "0", logo: UIImage(named: "falcons"))
        let nfcSouth3 = Team(teamName: "Carolina Panthers", wins: "7", losses: "9", ties: "0", logo: UIImage(named: "panthers"))
        let nfcSouth4 = Team(teamName: "Tampa Bay Buccaneers", wins: "5", losses: "11", ties: "0", logo: UIImage(named: "buccaneers"))
        
        let nfcSouth = [nfcSouth1, nfcSouth2, nfcSouth3, nfcSouth4]
        teams[.nfcSouth] = nfcSouth
        
        // NFC West
        let nfcWest1 = Team(teamName: "Los Angeles Rams", wins: "13", losses: "3", ties: "0", logo: UIImage(named: "rams"))
        let nfcWest2 = Team(teamName: "Seattle Seahawks", wins: "10", losses: "6", ties: "0", logo: UIImage(named: "seahawks"))
        let nfcWest3 = Team(teamName: "San Francisco 49ers", wins: "4", losses: "12", ties: "0", logo: UIImage(named: "49ers"))
        let nfcWest4 = Team(teamName: "Arizona Cardinals", wins: "3", losses: "13", ties: "0", logo: UIImage(named: "cardinals"))
        
        let nfcWest = [nfcWest1, nfcWest2, nfcWest3, nfcWest4]
        teams[.nfcWest] = nfcWest
        
        let divisions = Division(teams : teams)
        return divisions
    }
}
