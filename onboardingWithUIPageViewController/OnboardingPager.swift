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
}

// MARK: - UIPageViewControllerDataSource methods

extension OnboardingPager : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
}

// MARK: - UIPageViewControllerDelegate methods

extension OnboardingPager : UIPageViewControllerDelegate {
    
}