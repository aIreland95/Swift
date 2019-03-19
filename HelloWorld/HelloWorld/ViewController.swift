//
//  ViewController.swift
//  HelloWorld
//
//  Created by Aaron on 12/12/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

import UIKit

// Aaron Ireland
// Hello World
// December 17, 2018

class ViewController: UIViewController {

    // private variable decarations, one for a label, one for a textField
    @IBOutlet private var helloLabel: UILabel!
    @IBOutlet private var nameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // function for when the say hello button is pressed
    @IBAction func buttonPressed(_ sender: Any) {
        print("button pressed")
        
        // sets helloLabel text to "Hello " and the vvalue in the textField
        if let text: String = nameInput.text {
            helloLabel.text = "Hello \(text)!"
        }
    }
    
    // function for touch up outside for the say hello button, clears textField and label
    @IBAction func buttonSlip(_ sender: Any) {
        print("dragged off button")
        nameInput.text = ""
        helloLabel.text = ""
    }
    
    // function for dismiss button, clears textField and label
    @IBAction func buttonDismiss(_ sender: Any) {
        print("dismiss pressed")
        nameInput.text = ""
        helloLabel.text = ""
    }
}

