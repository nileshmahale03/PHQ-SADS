//
//  LeftMenuTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/1/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class LeftMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor.clearColor()
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "phq9" || segue.identifier == "gad7" || segue.identifier == "phq15" || segue.identifier == "panicSymptoms") {
            if (segue.identifier == "phq9") {
                
                DataSource.sharedInstance.currentTest = DataSource.sharedInstance.phq9Test
                
            } else if (segue.identifier == "gad7") {
                
                DataSource.sharedInstance.currentTest = DataSource.sharedInstance.gad7Test
                
            } else if (segue.identifier == "phq15") {
                
                DataSource.sharedInstance.currentTest = DataSource.sharedInstance.phq15Test
                
            } else if (segue.identifier == "panicSymptoms") {
                
                DataSource.sharedInstance.currentTest = DataSource.sharedInstance.panicSymptomsTest
            }
            
            let a = DataSource.sharedInstance.currentTest?.questions.count
            
            DataSource.sharedInstance.currentAnswerSet = [Int]()
            for _ in 0..<a! {
                DataSource.sharedInstance.currentAnswerSet?.append(0)
            }
            
            let navigationController: UINavigationController = segue.destinationViewController as! UINavigationController
            let testViewController: TestViewController = navigationController.viewControllers[0] as! TestViewController
            testViewController.pageTitles = DataSource.sharedInstance.currentTest!.questions
            testViewController.pageOptions = DataSource.sharedInstance.currentTest!.options
            testViewController.title = DataSource.sharedInstance.currentTest?.title
        }

    }

}
