//
//  StepOne.swift
//  onboardingWithUIPageViewController
//
//  Created by Robert Chen on 8/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class StepOne : UIViewController {
    
    // the tofu
    @IBOutlet weak var imageView: UIImageView!
    
    // the tofu's center-x and the trash can's center-x
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!

    // the tofu's bottom and the trash can's bottom
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(animated: Bool) {
        // reset animation to starting point
        // so user can scroll back and re-watch.
        // these numbers are pure trial and error, and might not work for other screens.
        verticalConstraint.constant = 120
        horizontalConstraint.constant = 104
        imageView?.transform = CGAffineTransformMakeRotation(0)
        
        // this hacky delay is so the screen gets its stuff in order before we start animating.
        // otherwise the entire screen starts morphing in strange ways.
        HelperLibrary.delay(seconds: 0.5, completion: {
            
            // vertical animation of the tofu dropping.
            // not meant to be precise like newton's law
            UIView.animateWithDuration(1.0,
                delay: 0.0,
                options: .CurveEaseIn,
                animations: {
                    // constraints don't get animated by default, so you need layoutIfNeeded()
                    self.verticalConstraint.constant = 20
                    self.view.layoutIfNeeded()
                },
                completion: nil
            )
            
            // horizontal animation is twice as fast.
            // gotta get to tofu over the can before it drops too far.
            UIView.animateWithDuration(0.5,
                delay: 0.0,
                options: .CurveLinear,
                animations: {
                    // again, using layoutIfNeeded() for animating constraints
                    self.horizontalConstraint.constant = 0
                    self.view.layoutIfNeeded()
                    // flip the tofu
                    self.imageView?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                },
                completion: nil
            )
            
        })
        
    }
    
}
