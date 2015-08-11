//
//  OnboardingPager.swift
//  onboardingWithUIPageViewController
//
//  Created by Robert Chen on 8/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class OnboardingPager : UIPageViewController {
    
    override func viewDidLoad() {
        // Set the dataSource and delegate in code.  
        // I can't figure out how to do this in the Storyboard!
        dataSource = self
        delegate = self
        
        // This is the starting point.  Start with step zero.
        setViewControllers([getStepZero()], direction: .Forward, animated: false, completion: nil)
    }
    
    func getStepZero() -> StepZero {
        return storyboard!.instantiateViewControllerWithIdentifier("StepZero") as! StepZero
    }
    
    func getStepOne() -> StepOne {
        return storyboard!.instantiateViewControllerWithIdentifier("StepOne") as! StepOne
    }
    
    func getStepTwo() -> StepTwo {
        return storyboard!.instantiateViewControllerWithIdentifier("StepTwo") as! StepTwo
    }
}

// MARK: - UIPageViewControllerDataSource methods

extension OnboardingPager : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(StepTwo) {
            // 2 -> 1
            return getStepOne()
        } else if viewController.isKindOfClass(StepOne) {
            // 1 -> 0
            return getStepZero()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(StepZero) {
            // 0 -> 1
            return getStepOne()
        } else if viewController.isKindOfClass(StepOne) {
            // 1 -> 2
            return getStepTwo()
        } else {
            // 2 -> end of the road
            return nil
        }
    }
    
}

// MARK: - UIPageViewControllerDelegate methods

extension OnboardingPager : UIPageViewControllerDelegate {
    
}