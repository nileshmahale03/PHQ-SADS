//
//  DataSource.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/10/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    //1
    var phq9Questions = NSArray(objects:
    "Over the last 2 weeks, how often have you been bothered by any of the following problems? \n" + "Little interest or pleasure in doing things.",
    "Feeling down, depressed, or hopeless.",
    "Trouble falling or staying asleep, or sleeping too much.",
    "Feeling tired or having little energy.",
    "Poor appetite or overeating.",
    "Feeling bad about yourself — or that you are a failure or have let yourself or your family down.",
    "Trouble concentrating on things, such as reading the newspaper or watching television.",
    "Moving or speaking so slowly that other people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual.",
    "Thoughts that you would be better off dead or of hurting yourself in some way.")
    
    var gad7Questions = NSArray(objects:
    "Over the last 2 weeks, how often have you been bothered by the following problems? \n" + "Feeling nervous, anxious, or on edge.",
    "Not being able to stop or control worrying.",
    "Worrying too much about different things.",
    "Trouble relaxing.",
    "Being so restless that it's hard to sit still.",
    "Becoming easily annoyed or irritable.",
    "Feeling afraid as if something awful might happen.")
    
    var phq15Questions = NSArray(objects:
    "During the last 4 weeks, how much have you been Not bothered by any of the following problems? \n" + "Stomach pain.",
    "Back pain.",
    "Pain in your arms, legs, or joints (knees, hips, etc.).",
    "Feeling tired or having little energy.",
    "Trouble falling or staying asleep, or sleeping too much.",
    "Menstrual cramps or other problems with your periods.",
    "Pain or problems during sexual intercourse.",
    "Headaches.",
    "Chest pain.",
    "Dizziness.",
    "Fainting spells.",
    "Feeling your heart pound or race.",
    "Shortness of breath.",
    "Constipation, loose bowels, or diarrhea.",
    "Nausea, gas, or indigestion.")
    
    var currentQuestionSet: NSArray?
    
    //score
    var currentAnswerSet: [Int]?
    
    class var sharedInstance: DataSource {
        //2
        struct Singleton {
            //3
            static let instance = DataSource()
        }
        //4
        return Singleton.instance
    }

}
