//
//  PHQ-9TestViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/1/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UIPageViewControllerDataSource {
    
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var organizeBarButton: UIBarButtonItem!
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        //UIColor(colorLiteralRed: 231.0/255.0, green: 95.0/255.0, blue: 53.0/255.0, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont(name: "avenir next condensed", size: 21)!]
        
        // When the menu button is tapped, it will call the revealToggle: method to display the left-sidebar menu & when the organize button is tapped, it will call the revealToggle: method to display the right-sidebar menu.
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 200
            menuBarButton.target = revealViewController()
            menuBarButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            organizeBarButton.target = revealViewController()
            organizeBarButton.action = "rightRevealToggle:"
            
        // User can swipe the content area to activate the sidebar as well
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
            
            self.pageViewController.dataSource = self
            
            let startViewController = self.viewControllerAtIndex(0) as ContentViewController
            let viewControllers = NSArray(object: startViewController)
            
            self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
            
            self.addChildViewController(self.pageViewController)
            self.view.addSubview(self.pageViewController.view)
            self.pageViewController.didMoveToParentViewController(self)
            
        }
    }

    func viewControllerAtIndex(index: Int) -> ContentViewController {
        
        if (self.pageTitles.count == 0) || (index >= self.pageTitles.count) {
            return ContentViewController()
        }
        
        let viewController: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        viewController.pageIndex = index
        viewController.titleText = self.pageTitles[index] as! String
        
        return viewController
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! ContentViewController
        var index = viewController.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let viewController = viewController as! ContentViewController
        var index = viewController.pageIndex as Int
        
        if (index ==  NSNotFound) {
            return nil
        }
        
        
        
        index++
        
        if (index == self.pageTitles.count) {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    // The number of items reflected in the page indicator.
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return self.pageTitles.count
    }
    
    // The selected item reflected in the page indicator.
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return 0
        
    }
    



}
