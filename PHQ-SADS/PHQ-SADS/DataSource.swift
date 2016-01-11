//
//  DataSource.swift
//  PHQ-SADS
//
//  Created by Ricky Panzer on 1/10/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
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
        "I find it easy to introduce yourself to other people.",
        "I often get so lost in thoughts that you ignore or forget your surroundings.",
        "I try to respond to your e-mails as soon as possible and cannot stand a messy inbox.",
        "You find it easy to stay relaxed and focused even when there is some pressure.",
        "You don't usually initiate conversations.",
        "You feel a constant need for something new.",
        "You have numerous and varied interests rather than several specific ones.",
        "Being adaptable is more important to you than being organized.",
        "Being able to develop a plan and stick to it is the most important part of every project.")
    
    var currentQuestionSet : NSArray?
    
    var currentAnswerSet : [Int]?
    
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
