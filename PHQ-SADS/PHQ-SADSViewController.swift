//
//  PHQ-SADSViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/2/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import SWRevealViewController

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
            revealViewController().rearViewRevealWidth = 200
            menuBarButton.target = revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rightViewRevealWidth = 150
            organizeBarButton.target = revealViewController()
            organizeBarButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            // User can swipe the content area to activate the sidebar as well
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

}
