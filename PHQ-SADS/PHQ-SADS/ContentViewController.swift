//
//  ContentViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/9/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var pageIndex: Int!
    var titleText: String!
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // by deafult "Go To Result" button is hidden
        goToResultButton.hidden = true
        
        self.questionLabel.text = self.titleText
        
    }
    
    // This is what will happen when user clicks 1st button
    @IBAction func checkBoxActionOne(sender: UIButton) {
        // if its not selected then select it ; if its already selected then unselect it 
        if (checkedOne == false) {
            
            //score
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 0
            
            checkBoxButtonOne.setImage(UIImage(named: "markedCheckBox"), forState: .Normal)
            checkBoxButtonTwo.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonThree.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonFour.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            
            optionLabelOne.textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
            optionLabelTwo.textColor = UIColor.lightGrayColor()
            optionLabelThree.textColor = UIColor.lightGrayColor()
            optionLabelFour.textColor = UIColor.lightGrayColor()
            
            checkedOne = true
            
            // go to result button will appear only at last question
            if (pageIndex == (DataSource.sharedInstance.currentQuestionSet?.count)! - 1) {
                goToResultButton.hidden = false
            }
        } else if (checkedOne == true) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 0
            
            checkBoxButtonOne.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            optionLabelOne.textColor = UIColor.lightGrayColor()
            goToResultButton.hidden = true
            checkedOne = false
        }
    }

    @IBAction func checkBoxActionTwo(sender: UIButton) {
        if (checkedTwo == false) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 1
            
            checkBoxButtonOne.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonTwo.setImage(UIImage(named: "markedCheckBox"), forState: .Normal)
            checkBoxButtonThree.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonFour.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            
            optionLabelOne.textColor = UIColor.lightGrayColor()
            optionLabelTwo.textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
            optionLabelThree.textColor = UIColor.lightGrayColor()
            optionLabelFour.textColor = UIColor.lightGrayColor()
            
            checkedTwo = true
            
            if (pageIndex == (DataSource.sharedInstance.currentQuestionSet?.count)! - 1) {
                goToResultButton.hidden = false
            }
        } else if (checkedTwo == true) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 0
            
            checkBoxButtonTwo.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            optionLabelTwo.textColor = UIColor.lightGrayColor()
            goToResultButton.hidden = true
            checkedTwo = false
        }
    }
    
    @IBAction func checkBoxActionThree(sender: UIButton) {
        if (checkedThree == false) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 2
            
            checkBoxButtonOne.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonTwo.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonThree.setImage(UIImage(named: "markedCheckBox"), forState: .Normal)
            checkBoxButtonFour.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            
            optionLabelOne.textColor = UIColor.lightGrayColor()
            optionLabelTwo.textColor = UIColor.lightGrayColor()
            optionLabelThree.textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
            optionLabelFour.textColor = UIColor.lightGrayColor()
            
            checkedThree = true
            
            if (pageIndex == (DataSource.sharedInstance.currentQuestionSet?.count)! - 1) {
                goToResultButton.hidden = false
            }
        } else if (checkedThree == true) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 0
            
            checkBoxButtonThree.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            optionLabelThree.textColor = UIColor.lightGrayColor()
            goToResultButton.hidden = true
            checkedThree = false
        }
    }
    
    @IBAction func checkBoxActionFour(sender: UIButton) {
        if (checkedFour == false) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 3
            
            checkBoxButtonOne.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonTwo.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonThree.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            checkBoxButtonFour.setImage(UIImage(named: "markedCheckBox"), forState: .Normal)
            
            optionLabelOne.textColor = UIColor.lightGrayColor()
            optionLabelTwo.textColor = UIColor.lightGrayColor()
            optionLabelThree.textColor = UIColor.lightGrayColor()
            optionLabelFour.textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
            
            checkedFour = true
            
            if (pageIndex == (DataSource.sharedInstance.currentQuestionSet?.count)! - 1) {
                goToResultButton.hidden = false
            }
        } else if (checkedFour == true) {
            
            DataSource.sharedInstance.currentAnswerSet![pageIndex] = 0
            
            checkBoxButtonFour.setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            optionLabelFour.textColor = UIColor.lightGrayColor()
            goToResultButton.hidden = true
            checkedFour = false
        }
    }
    
}






