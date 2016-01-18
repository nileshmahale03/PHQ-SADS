//
//  PHQTest.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/17/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class PHQTest: NSObject {

    var title: String = ""
    var questions: [String] = [String]()
    var diagnosis: [String] = [String]()
    
    convenience init(questions: [String], diagnosis: [String], title: String) {
        self.init()
        self.questions = questions
        self.diagnosis = diagnosis
        self.title = title
    }

}
