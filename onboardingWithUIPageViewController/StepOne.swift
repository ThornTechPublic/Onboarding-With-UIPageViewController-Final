//
//  StepOne.swift
//  onboardingWithUIPageViewController
//
//  Created by Robert Chen on 8/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class StepOne : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        horizontalConstraint.constant = 0
        verticalConstraint.constant = 20

        UIView.animateWithDuration(2.0,
            delay: 0.5,
            options: .CurveEaseIn,
            animations: {
                self.view.layoutIfNeeded()
            },
            completion: nil
        )
        
    }
}
