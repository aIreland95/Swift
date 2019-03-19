//
//  ViewController.swift
//  nlfStandings
//
//  Created by Aaron on 1/14/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

// class for the main view controller, including delegation and dataSource
class ViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private let division = Division.seedData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
}

// extension for dataSource, sets table cell UIElements to specific values and separates cells by division
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return division.teams.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let type = TeamType(rawValue: section) ?? .afcEast
        let divisions = division.teams[type]
        return divisions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let type = TeamType(rawValue: section) else { return nil }
        return type.teamDivision
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        if let type = TeamType(rawValue: indexPath.section) {
            let teams = division.teams[type]
            
            if let team = teams?[indexPath.row] {
                
                cell.teamNameLabel.text = team.teamName
                cell.teamRecordLabel.text = team.record
                cell.teamLogoView.image = team.logo
                cell.selectionStyle = .none
            }
            
        }
        
        return cell
    }
}

// variables for the purpose of passing values to the TeamViewController
private var logoOfTeam = UIImageView()
private var nameOfTeam = String()
private var winsOfTeam = String()
private var lossesOfTeam = String()
private var tiesOfTeam = String()

// extension for UITableViewDelegate, used for passing data between ViewControllers
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let type = TeamType(rawValue: indexPath.section) {
            let divisions = division.teams[type]
            
            if (divisions?[indexPath.row]) != nil {
                
                if let team = divisions?[indexPath.row] {
                    
                    logoOfTeam.image = team.logo
                    nameOfTeam = team.teamName
                    winsOfTeam = team.wins
                    lossesOfTeam = team.losses
                    tiesOfTeam = team.ties
                    
                }
                
                
                guard let viewController = storyboard?.instantiateViewController(withIdentifier: "TeamViewController") as? TeamViewController else { return }
                
                performSegue(withIdentifier: "TeamDataSegue", sender: self)
                
                present(viewController, animated: true, completion: nil)
                
                tableView.deselectRow(at: indexPath, animated: true)
                
            }
        }
    }
    
    // override function that prepares for a segue, sets the TeamViewController values to the team selected in the table
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let TeamViewController = segue.destination as! TeamViewController
        
        TeamViewController.logo = logoOfTeam
        TeamViewController.name = nameOfTeam
        TeamViewController.wins = winsOfTeam
        TeamViewController.losses = lossesOfTeam
        TeamViewController.ties = tiesOfTeam
    }
    
}
