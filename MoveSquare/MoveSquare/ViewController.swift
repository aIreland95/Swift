//
//  ViewController.swift
//  MoveSquare
//
//  Created by Aaron on 2/6/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // variable for the view, named squareView
    @IBOutlet private var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //private var squareX = squareView.frame.origin.x

    // function for pressing the move button
    @IBAction func movePressed(_ sender: Any) {
        
        // transition block
        UIView.transition(with: squareView, duration: 0.4, options: [], animations: {
            
            // calls the position method
            self.position()
            
        }, completion: nil)
    }
    
    // function for pressing the move & reset button
    @IBAction func moveResetPressed(_ sender: Any) {
        
        // transition block
        UIView.transition(with: squareView, duration: 0.4, options: [], animations: {
            
            // calls the position method
            self.position()
            
        }, completion: { finished in
            
            if finished {
                
                // calls the moveToStart() function when the first move is completed
                self.moveToStart()
            }
        }
    )}
    
    // function used for checking the position of squareView, using x and y frame origins
    func position() {
        
        // check statements: checks the frame origins of the squareView's x and y positions
        if (self.squareView.frame.origin.x == 0 && self.squareView.frame.origin.y == 0) {
            
            self.squareView.frame.origin.x = 364
        }
        else if (self.squareView.frame.origin.x == 364 && self.squareView.frame.origin.y == 0) {
            
            self.squareView.frame.origin.y = 686
        }
        else if (self.squareView.frame.origin.x == 364 && self.squareView.frame.origin.y == 686) {
            
            self.squareView.frame.origin.x = 0
        }
        else if (self.squareView.frame.origin.x == 0 && self.squareView.frame.origin.y == 686) {
            
            self.squareView.frame.origin.y = 0
        }
    }
    
    // function for moving the squareView back to the start, used as a finsih criteria
    func moveToStart() {
        
        // transition block
        UIView.transition(with: squareView, duration: 0.4, options: [], animations: {
            
            self.squareView.frame.origin.x = 0
            self.squareView.frame.origin.y = 0
            
        }, completion: nil)
    }
}
