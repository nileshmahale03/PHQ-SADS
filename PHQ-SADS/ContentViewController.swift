//
//  ContentViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/9/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import CoreData

class ContentViewController: UIViewController {
    
    var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var pageIndex: Int!
    var titleText: String!
    
    var optionOneText: String!
    var optionTwoText: String!
    var optionThreeText: String!
    var optionFourText: String!
    
    var checkedOne: Bool = false
    var checkedTwo: Bool = false
    var checkedThree: Bool = false
    var checkedFour: Bool = false
    
    // question label
    @IBOutlet weak var questionLabel: UILabel!
    
    //check box button
    @IBOutlet weak var checkBoxButtonOne: UIButton!
    @IBOutlet weak var checkBoxButtonTwo: UIButton!
    @IBOutlet weak var checkBoxButtonThree: UIButton!
    @IBOutlet weak var checkBoxButtonFour: UIButton!
    
    //options label 
    @IBOutlet weak var optionLabelOne: UILabel!
    @IBOutlet weak var optionLabelTwo: UILabel!
    @IBOutlet weak var optionLabelThree: UILabel!
    @IBOutlet weak var optionLabelFour: UILabel!
    
    //go to result button
    @IBOutlet weak var goToResultButton: UIButton!
    
    //check box button array
    var checkBoxes: [UIButton] = [UIButton]()
    
    //option label array
    var optionLabels: [UILabel] = [UILabel]()
    
    //checked bool
    var checkedBool: [Bool] = [Bool]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // by deafult "Go To Result" button is hidden
        goToResultButton.hidden = true
        
        self.questionLabel.text = self.titleText
        
        self.optionLabelOne.text = self.optionOneText
        self.optionLabelTwo.text = self.optionTwoText
        self.optionLabelThree.text = self.optionThreeText
        self.optionLabelFour.text = self.optionFourText
        
        if (optionLabelOne.text == "") {
            checkBoxButtonOne.hidden = true
            optionLabelOne.hidden = true
        }
        
        if (optionLabelTwo.text == "") {
            checkBoxButtonTwo.hidden = true
            optionLabelTwo.hidden = true
        }
        
        if (optionLabelThree.text == "") {
            checkBoxButtonThree.hidden = true
            optionLabelThree.hidden = true
        }
        
        if (optionLabelFour.text == "") {
            checkBoxButtonFour.hidden = true
            optionLabelFour.hidden = true
        }
        
        //initiate check boxes array and option labels array and checked bool array
        checkBoxes = [checkBoxButtonOne, checkBoxButtonTwo, checkBoxButtonThree, checkBoxButtonFour]
        
        optionLabels = [optionLabelOne, optionLabelTwo, optionLabelThree, optionLabelFour]
        
        checkedBool = [checkedOne, checkedTwo, checkedThree, checkedFour]
        
    }
    
    // This is what will happen when user clicks 1st button
    @IBAction func checkBoxActionOne(sender: UIButton) {
        checkBoxAction(0)
    }

    @IBAction func checkBoxActionTwo(sender: UIButton) {
        checkBoxAction(1)
     }
    
    @IBAction func checkBoxActionThree(sender: UIButton) {
        checkBoxAction(2)
    }
    
    @IBAction func checkBoxActionFour(sender: UIButton) {
        checkBoxAction(3)
    }
    
    func checkBoxAction(index: Int) {
        // if its not selected then select it ; if its already selected then unselect it
        if (checkedBool[index] == false) {
            //score
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = index
            
            selectOption(index)
            
            clearOtherOptions(index)
            
            //automatically go to next question
            if (pageIndex != (DataSource.sharedInstance.currentTest?.questions.count)! - 1) {
                
                let testViewController: TestViewController = self.parentViewController?.parentViewController as! TestViewController
                let startViewController = testViewController.viewControllerAtIndex(pageIndex+1) as ContentViewController
                let viewControllers = NSArray(object: startViewController)
                
                testViewController.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
                
            }
            
            // if its a last question then go to result button will become visible
            if (pageIndex == (DataSource.sharedInstance.currentTest?.questions.count)! - 1) {
                goToResultButton.hidden = false
            }
        } else if (checkedBool[index] == true) {
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 0
            
            clearOption(index)
            
            goToResultButton.hidden = true
        }
    }
    
    func clearOtherOptions(let index : Int){
        var options = [0, 1, 2, 3]
        options.removeAtIndex(index)
        
        for i in options {
            clearOption(i)
        }
        
    }
    
    func selectOption(let index: Int){
        checkBoxes[index].setImage(UIImage(named: "markedCheckBox"), forState: .Normal)
        optionLabels[index].textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
        checkedBool[index] = true
    }
    
    func clearOption(let index: Int){
        checkBoxes[index].setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
        optionLabels[index].textColor = UIColor.lightGrayColor()
        checkedBool[index] = false
    }
    
    //save test score and date to the core data which will get displayes in history tab later
    @IBAction func goToResultButtonAction(sender: UIButton) {
        print("pressed go to result button")
        
        if let currentAnswerSet = DataSource.sharedInstance.currentAnswerSet {

            let entityDescription = NSEntityDescription.entityForName("History", inManagedObjectContext: managedObjectContext)
            let history = History(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
            
            history.test = (DataSource.sharedInstance.currentTest?.title)!
            history.score = String(currentAnswerSet.reduce(0, combine: +))
            history.date = String(NSDate())
            
            print("\(history.test), \(history.score), \(history.date)")
            
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                print(error)
            }
        }
    }
    
}






