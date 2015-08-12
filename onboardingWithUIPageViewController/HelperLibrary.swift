//
//  HelperLibrary.swift
//  onboardingWithUIPageViewController
//
//  Created by Robert Chen on 8/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import Foundation

class HelperLibrary {
    
    // helper function to delay whatever's in the callback
    class func delay(#seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
}