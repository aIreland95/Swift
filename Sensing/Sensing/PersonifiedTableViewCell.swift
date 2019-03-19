//
//  PersonifiedTableViewCell.swift
//  Sensing
//
//  Created by Aaron on 1/14/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class PersonifiedTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var hearLabel: UILabel!
    @IBOutlet var seeLabel: UILabel!
    @IBOutlet var petLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
