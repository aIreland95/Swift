//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Aaron on 2/4/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showHideLabel: UILabel!
    @IBOutlet var rectangleView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showHidePressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            
            if sender.title(for: .normal) == "Hide" {
                
                self.showHideLabel.alpha = 0
                sender.setTitle("Show", for: .normal)
            }
            else {
                
                self.showHideLabel.alpha = 1
                sender.setTitle("Hide", for: .normal)
            }
        }
    }
    
    @IBAction func changeColor(_ sender: Any) {
        
        UIView.transition(with: showHideLabel, duration: 0.5, options: .transitionFlipFromBottom, animations: {
            
            let value = Int.random(in: 0...4)
            
            switch value {
            case 0: self.showHideLabel.backgroundColor = .red
            case 1: self.showHideLabel.backgroundColor = .blue
            case 2: self.showHideLabel.backgroundColor = .purple
            case 3: self.showHideLabel.backgroundColor = .green
            default: self.showHideLabel.backgroundColor = .magenta
            }
            
        }, completion: nil)
    }
    
    @IBAction func moveButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            
            if self.rectangleView.frame.origin.x <= 50 {
                
                self.rectangleView.frame.origin.x = 150
            }
                
            else {
                self.rectangleView.frame.origin.x = 10
            }
        }
    }
    
    @IBAction func changeSize(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 25, initialSpringVelocity: 1, options: [], animations: {
            
            if self.rectangleView.frame.height <= 130 {
            
            self.rectangleView.frame.size.height = 500
            }
            
            else {
            self.rectangleView.frame.size.height = 128
            }
        }) { (finished) in
            
            }
        }
    
    @IBAction func rotateButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            
            //self.rectangleView.transform = self.rectangleView.transform.scaledBy(x: 5, y: 1)
            self.rectangleView.transform = self.rectangleView.transform.rotated(by: -.pi/2.0)
        }
    }
    
    @IBAction func llamaFootballPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            if sender.title(for: .normal) == "llama" {
                self.imageView.image = UIImage(named: "llama")
                sender.setTitle("steelers", for: .normal)
            }
            else {
                self.imageView.image = UIImage(named: "steelers")
                sender.setTitle("llama", for: .normal)
            }
        }, completion: nil)
    }
}

