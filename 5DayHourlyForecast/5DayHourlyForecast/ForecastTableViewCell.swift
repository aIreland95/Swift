//
//  ForecastTableViewCell.swift
//  5DayHourlyForecast
//
//  Created by Aaron on 2/4/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    // outlets for the dateTimeLabel and highLowLabel (for temperature)
    @IBOutlet var dateTimeLabel: UILabel!
    @IBOutlet var highLowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
