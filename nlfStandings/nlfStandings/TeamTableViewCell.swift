//
//  TeamTableViewCell.swift
//  nlfStandings
//
//  Created by Aaron on 1/23/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

// class for the table view cell that contains each teams information: team name, logo, and record
class TeamTableViewCell: UITableViewCell {

    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var teamRecordLabel: UILabel!
    @IBOutlet var teamLogoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
