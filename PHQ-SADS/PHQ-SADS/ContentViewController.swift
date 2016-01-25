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
    
//    var checkedOne: Bool = false
//    var checkedTwo: Bool = false
//    var checkedThree: Bool = false
//    var checkedFour: Bool = false
    
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
    
    var checkBoxes : [UIButton] = [UIButton]()
    var optionLabels : [UILabel] = [UILabel]()
//    var checkedBools : [Bool] = [Bool]()
    
    //go to result button
    @IBOutlet weak var goToResultButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // by deafult "Go To Result" button is hidden
        goToResultButton.hidden = true
        
        self.questionLabel.text = self.titleText
        
        self.checkBoxes = [checkBoxButtonOne, checkBoxButtonTwo, checkBoxButtonThree, checkBoxButtonFour]
        self.optionLabels = [optionLabelOne, optionLabelTwo, optionLabelThree, optionLabelFour]
//        self.checkedBools = [checkedOne, checkedTwo, checkedThree, checkedFour]
        
        if (scoreForPage() >= 0){
            markAnswer(scoreForPage())
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {

    }
    
    // This is what will happen when user clicks 1st button
    @IBAction func checkBoxActionOne(sender: UIButton) {
        // if its not selected then select it ; if its already selected then unselect it 

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
    
    func scoreForPage() -> Int {
        return DataSource.sharedInstance.currentAnswerSet![pageIndex]
    }
    func setScoreForPage(score : Int){
        DataSource.sharedInstance.currentAnswerSet![pageIndex] = score
    }
    
    func checkBoxAction(score : Int){
        if (scoreForPage() != score){
            
            setScoreForPage(score)
            
            if (markAnswer(score)){
                return
            }
            
        }
        else if (scoreForPage() == score){
            
            checkBoxes[score].setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            optionLabels[score].textColor = UIColor.lightGrayColor()
            goToResultButton.hidden = true

            
            setScoreForPage(-1)
            
        }
        
        if (pageIndex != (DataSource.sharedInstance.currentTest?.questions.count)! - 1) {
            let tvc : TestViewController = self.parentViewController?.parentViewController as! TestViewController
            
            let startViewController = tvc.viewControllerAtIndex(pageIndex+1) as ContentViewController
            let viewControllers = NSArray(object: startViewController)
            
            tvc.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    func markAnswer(score : Int) -> Bool{
        for (var i = 0; i<4; i++){
            checkBoxes[i].setImage(UIImage(named: "blankedCheckBox"), forState: .Normal)
            optionLabels[i].textColor = UIColor.lightGrayColor()
            
        }
        
        checkBoxes[score].setImage(UIImage(named: "markedCheckBox"), forState: .Normal)
        optionLabels[score].textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
        
        if (pageIndex == (DataSource.sharedInstance.currentTest?.questions.count)! - 1) {
            goToResultButton.hidden = false
            return true
        }
        
        return false
    }
    
}






