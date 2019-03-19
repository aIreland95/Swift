//
//  ViewController.swift
//  jediSith
//
//  Created by Aaron on 12/17/18.
//  Copyright © 2018 Aaron. All rights reserved.
//

// Aaron Ireland
// January 1, 2019
// Jedi or Sith

import UIKit

class ViewController: UIViewController {

    // private variables for a message, an imageView, and two images
    private let message = UILabel.init()
    private let saberImage = UIImage(named: "BlueLightSaber")
    private let sithImage = UIImage(named: "RedLightSaber")
    private var imageView = UIImageView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // creates the frame, content mode, and adds the imageView to the view
        imageView = UIImageView(frame: CGRect(x: 49, y: 679, width: 326, height: 183))
        imageView.contentMode = .scaleAspectFill
        imageView.center.x = view.center.x
        view.addSubview(imageView)
        
        // setting constraints for the imageView
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        // creates the frame, text settings, and adds the message label to the view
        message.frame = CGRect(x: 49.0, y: 700.0, width: 326.0, height: 47.0)
        message.textAlignment = .center
        message.font = message.font.withSize(30)
        message.text = ""
        message.textColor = .yellow
        message.center.x = imageView.center.x
        message.center.y = imageView.center.y
        self.view.addSubview(message)
        
        // setting constraints for the message label
        message.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        message.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        message.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    // function for rey's jedi button being pressed
    @IBAction func reyJedi(_ sender: Any) {
        
        message.text = "Rey chose the light side"
        imageView.image = saberImage
    }
    // function for rey's sith button being pressed
    @IBAction func reySith(_ sender: Any) {
        
        message.text = "Rey chose the dark side"
        imageView.image = sithImage
    }
    // function for kylo's jedi button being pressed
    @IBAction func kyloJedi(_ sender: Any) {
        
        message.text = "Kylo chose the light side"
        imageView.image = saberImage
    }
    // function for kylo's sith button being pressed
    @IBAction func kyloSith(_ sender: Any) {
        
        message.text = "Kylo chose the dark side"
        imageView.image = sithImage
    }
}

