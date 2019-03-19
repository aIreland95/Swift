//
//  ViewController.swift
//  llamaSightings
//
//  Created by Aaron on 12/19/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var sightingDate: UILabel!
    
    private var reportedByLabel: UILabel!
    private var reportedByValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportedByLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        reportedByLabel.font = UIFont.systemFont(ofSize: sightingDate.font.pointSize, weight: .bold)
        reportedByLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reportedByLabel)
        
        reportedByValue = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        reportedByValue.textAlignment = .right
        reportedByValue.font = UIFont.systemFont(ofSize: sightingDate.font.pointSize, weight: .bold)
        reportedByValue.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reportedByLabel)
        
        reportedByLabel.text = "Reported By:"
        reportedByValue.text = "Aaron Ireland"
        
        NSLayoutConstraint.activate([
            reportedByLabel.topAnchor.constraint(equalTo: sightingDate.bottomAnchor, constant: 30.0),
            reportedByLabel.leadingAnchor.constraint(equalTo: sightingDate.leadingAnchor),
            
            reportedByValue.centerYAnchor.constraint(equalTo: reportedByLabel.centerYAnchor),
            reportedByValue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0)
            ])
    }
}

// fml

