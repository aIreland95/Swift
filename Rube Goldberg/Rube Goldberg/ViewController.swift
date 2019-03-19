//
//  ViewController.swift
//  Rube Goldberg
//
//  Created by Aaron on 2/18/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // variable declarations
    @IBOutlet var UIArrow: UIImageView!
    @IBOutlet var UIBalloon: UIImageView!
    @IBOutlet var UIAnvil: UIImageView!
    @IBOutlet var UIButton: UIImageView!
    @IBOutlet var UIFlame: UIImageView!
    @IBOutlet var UIJackBox: UIView!
    @IBOutlet var UIClown: UIImageView!
    
    private var travelDistance: CGFloat = 1
    
    // declaration of a UIViewPropertyAnimator
    private var animator = UIViewPropertyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // function using the pan gesture recognizer on the arrow
    @IBAction func arrowPulled(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
            
            // began case, or when a finger is placed on the device screen
        case .began:
            
            animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
                
                self.view.layoutIfNeeded()
                
            })
            animator.pauseAnimation()
            
            // change case, or when a finger pulls back the arrow image
        case .changed:
            
            let translation = sender.translation(in: view)
            view.bringSubviewToFront(UIArrow)
            UIArrow.center = CGPoint(x: UIArrow.center.x + translation.x, y: 130)
            sender.setTranslation(CGPoint.zero, in: view)
            
            animator.fractionComplete = -translation.x / travelDistance
            
            // ended case, or when a finger is removed form the arrow image
        case .ended:
            shootArrow()
            
            // default case
        default:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            
        }
    }
    
    //~~~~~~~~~~ Functions for chain reactions ~~~~~~~~~~
    
    // function for shooting the arrow
    func shootArrow() {
    
        // basic transition block, changes the x positioning of the arrow
        UIView.transition(with: UIArrow, duration: 0.5, options: [], animations: {
            
            self.UIArrow.frame.origin.x = 322
            
            // upon completion calls the dropWeight() function
        }, completion: { finished in
            
            if finished {
                
                self.dropWeight()
            }
        })
    }
    
    // function for dropping the weight "onto" the button
    func dropWeight() {
        
        // basic animation block, changes y position of the balloon and the weight
        UIView.animate(withDuration: 0.6, delay: 0, options: [], animations: {
            
            self.UIBalloon.frame.origin.y = -75
            self.UIAnvil.frame.origin.y = self.UIButton.frame.origin.y - 15
            
            // upon completion calls the igniteFuse() function
        }, completion: { finished in
            
            if finished {
                
                self.igniteFuse()
            }
        })
    }
    
    // function for igniting the fuse, or sending the flame along the fuse boxes
    func igniteFuse() {
        
        // linear animation block, changes y position of the flame
        UIView.animate(withDuration: 3, delay: 0, options: .curveLinear, animations: {
            
            self.UIFlame.frame.origin.y = 685
            
            // upon completion calls the continueFuse() button
        }, completion: { finished in
            
            if finished {
                
                self.continueFuse()
            }
        })
    }
    
    // function for sending the flame along the horizontal fuse
    func continueFuse() {
        
        // EaseOut animation block
        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut, animations: {
            
            self.UIFlame.frame.origin.x = 175
            
            // upon completion calls the heatUpBox() function
        }, completion: { finished in
            
            if finished {
                
                self.heatUpBox()
            }
        })
    }
    
    // function for changing the color of the box
    func heatUpBox() {
        
        // transition the box's color to red
        UIView.transition(with: UIJackBox, duration: 1.5, options: [], animations: {
            
            self.UIJackBox.backgroundColor = .red
            
            // upon completion, calls the helloJack() function
        }, completion: { finished in
            
            if finished {
                
                self.helloJack()
            }
        })
        
    }
    
    // function for springing the clown "out" of the box, uses spring damping and velocity
    func helloJack() {
        
        // curveEaseInOut animation with a simple y position change
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options:.curveEaseInOut, animations: {
                
            self.UIClown.frame.origin.y = 466
                
        }, completion: nil)
    }
}

