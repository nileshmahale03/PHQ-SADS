//
//  ResultViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/1/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import CoreData

class ResultViewController: UIViewController {
  
    var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var organizeBarButton: UIBarButtonItem!
    @IBOutlet var diagnosisLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var actionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        self.navigationItem.title = "Result"
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
        
        //diagnosis
        if let currentAnswerSet = DataSource.sharedInstance.currentAnswerSet {
            switch currentAnswerSet.reduce(0, combine: +) {
            case 0...4:
                diagnosisLabel.text = DataSource.sharedInstance.currentTest?.diagnosis[0]
            case 5...9:
                diagnosisLabel.text = DataSource.sharedInstance.currentTest?.diagnosis[1]
            case 10...14:
                diagnosisLabel.text = DataSource.sharedInstance.currentTest?.diagnosis[2]
            case 15...19:
                diagnosisLabel.text = DataSource.sharedInstance.currentTest?.diagnosis[3]
            case 20...27:
                diagnosisLabel.text = DataSource.sharedInstance.currentTest?.diagnosis[4]
            default:
                diagnosisLabel.text = DataSource.sharedInstance.currentTest?.diagnosis[5]
            }
        }
        
        //score
        if let currentAnswerSet = DataSource.sharedInstance.currentAnswerSet {
            scoreLabel.text = String(currentAnswerSet.reduce(0, combine: +))
        }
        
        //action
        if let currentAnswerSet = DataSource.sharedInstance.currentAnswerSet {
            switch currentAnswerSet.reduce(0, combine: +) {
            case 0...4:
                actionLabel.text = "The score suggests the patient may not need depression treatment"
            case 5...14:
                actionLabel.text = "Physician uses clinical judgment about treatment, based on patient's duration of symptoms and functional impairment"
            case 15...27:
                actionLabel.text = "Warrants treatment for depression, using antidepressant, psychotherapy and/or a combination of treatment"
            default:
                actionLabel.text = "Action"
            }
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
