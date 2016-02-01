//
//  PHQ-SADSViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/2/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class PHQ_SADSViewController: UIViewController {
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var organizeBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        self.navigationItem.title = "Overview"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont(name: "avenir next condensed", size: 21)!]
        
        // When the menu button is tapped, it will call the revealToggle: method to display the left-sidebar menu & when the organize button is tapped, it will call the revealToggle: method to display the right-sidebar menu.
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 250
            menuBarButton.target = revealViewController()
            menuBarButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            organizeBarButton.target = revealViewController()
            organizeBarButton.action = "rightRevealToggle:"
            
            // User can swipe the content area to activate the sidebar as well
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
