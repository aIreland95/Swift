//
//  TeamViewController.swift
//  nlfStandings
//
//  Created by Aaron on 1/24/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

// class for the additional view controller for a single selected team
class TeamViewController: UIViewController {

    // variables based on labels and other UIElements
    @IBOutlet var teamLogo: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamWins: UILabel!
    @IBOutlet var teamLosses: UILabel!
    @IBOutlet var teamTies: UILabel!
    
    // variables set to empty values for segue purposes
    var logo = UIImageView()
    var name = String()
    var wins = String()
    var losses = String()
    var ties = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIElements set to previous variable values
        teamLogo.image = logo.image
        teamName.text = name
        teamWins.text = wins
        teamLosses.text = losses
        teamTies.text = ties
    }
    
    // action method for pressing the 'close' button
    @IBAction func closePressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
