//
//  ViewController.swift
//  AnimationDemo2
//
//  Created by Aaron on 2/11/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var commentLabel: UILabel!
    @IBOutlet private var commentView: UIView!
    @IBOutlet private var commentTopConstraint: NSLayoutConstraint!
    @IBOutlet private var blurView: UIVisualEffectView!
    
    private var animator = UIViewPropertyAnimator()
    private var totalDistanceToTravel: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.effect = nil
    }

    @IBAction func commentsTapped(_ sender: Any) {
        
        let backgroundColor: UIColor
        let visualEffect: UIVisualEffect?
        
        if (commentTopConstraint.constant == 0) {
            
            // hide comments
            self.commentTopConstraint.constant = view.frame.height - 100.0
            visualEffect = nil
            backgroundColor = .white
        }
        else {
            
            // show comments
            self.commentTopConstraint.constant = 0
            visualEffect = UIBlurEffect(style: .light)
            backgroundColor = UIColor.white.withAlphaComponent(0.5)
        }
        
        UIView.animate(withDuration: 0.5) {
            
            self.view.layoutIfNeeded()
            self.blurView.effect = visualEffect
            self.commentView.backgroundColor = backgroundColor
        }
    }
    
    
    @IBAction func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
            
        case .began:
            
            let backgroundColor: UIColor
            let visualEffect: UIVisualEffect?
            
            if (commentTopConstraint.constant == 0) {
                
                // hide comments
                totalDistanceToTravel = -view.frame.height + 100.0
                commentTopConstraint.constant = view .frame.height - 100
                
                visualEffect = nil
                backgroundColor = UIColor.white
            }
            else {
                
                // show comments
                totalDistanceToTravel = commentTopConstraint.constant
                commentTopConstraint.constant = 0
                
                visualEffect = UIBlurEffect(style: .light)
                backgroundColor = UIColor.white.withAlphaComponent(0.5)
            }
            
            animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn, animations: {
                
                    self.view.layoutIfNeeded()
                    self.blurView.effect = visualEffect
                    self.commentView.backgroundColor = backgroundColor
                })
            animator.pauseAnimation()
            
        case .changed:
            let translation = sender.translation(in: view)
            animator.fractionComplete = -translation.y / totalDistanceToTravel
            
        default:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            
        }
        
//        switch sender.state {
//
//        case .began:
//            break
//
//        case .changed:
//            let delta = sender.translation(in: nil)
//            let deltaY = delta.y
//            sender.setTranslation(.zero, in: nil)
//
//            var constant = self.commentTopConstraint.constant + deltaY
//            constant = max(0, constant)
//
//            self.commentTopConstraint.constant = constant
//            self.view.layoutIfNeeded()
//
//        case .cancelled, .ended:
//            break
//
//        default:
//            break
//        }
    }
}

