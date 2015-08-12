//
//  StepTwo.swift
//  onboardingWithUIPageViewController
//
//  Created by Robert Chen on 8/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class StepTwo : UIViewController {
    
    let burgerHeightOriginalState:CGFloat = -10
    
    @IBOutlet weak var burgerAirHeight: NSLayoutConstraint!
    @IBOutlet weak var burger: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        // reset animation to starting point
        // so user can scroll back and re-watch.
        burgerAirHeight.constant = burgerHeightOriginalState
        burger?.transform = CGAffineTransformMakeRotation(0)
        
        // this hacky delay is so the screen gets its stuff in order before we start animating.
        // otherwise the entire screen starts morphing in strange ways.
        HelperLibrary.delay(seconds: 0.5, completion: {
            
            // burger goes up
            // not meant to be precise like newton's law
            UIView.animateWithDuration(0.5,
                delay: 0.0,
                options: .CurveEaseOut,
                animations: {
                    // constraints don't get animated by default, so you need layoutIfNeeded()
                    self.burgerAirHeight.constant = 100
                    self.view.layoutIfNeeded()
                    // flip the burger
                    self.burger?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                },
                completion: nil
            )
            
            // burger goes down
            UIView.animateWithDuration(0.5,
                delay: 0.5,
                options: .CurveEaseIn,
                animations: {
                    // again, using layoutIfNeeded() for animating constraints
                    self.burgerAirHeight.constant = self.burgerHeightOriginalState
                    self.view.layoutIfNeeded()
                    // flip the tofu
                    self.burger?.transform = CGAffineTransformMakeRotation(0)
                },
                completion: nil
            )
            
        })
        
    }
    
}
