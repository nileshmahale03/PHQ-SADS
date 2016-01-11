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
    "You find it easy to introduce yourself to other people.",
    "You often get so lost in thoughts that you ignore or forget your surroundings.",
    "You try to respond to your e-mails as soon as possible and cannot stand a messy inbox.",
    "You find it easy to stay relaxed and focused even when there is some pressure.",
    "You don't usually initiate conversations.",
    "You feel a constant need for something new.",
    "You have numerous and varied interests rather than several specific ones.",
    "Being adaptable is more important to you than being organized.",
    "Being able to develop a plan and stick to it is the most important part of every project.")
    
    var gad7Questions = NSArray(objects:
    "Feeling nervous, anxious, or on edge.",
    "Not being able to stop or control worrying.",
    "Worrying too much about different things.",
    "Trouble relaxing.",
    "Being so restless that it's hard to sit still.",
    "Becoming easily annoyed or irritable.",
    "Feeling afraid as if something awful might happen.")
    
    var phq15Questions = NSArray(objects:
    "During the last 4 weeks, how much have you been Not bothered by any of the following problems? Stomach pain.",
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
