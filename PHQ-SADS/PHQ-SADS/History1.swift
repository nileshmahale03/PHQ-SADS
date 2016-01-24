//
//  History.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/23/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class History1: NSObject {
    
    var date:String = ""
    var test:String = ""
    var score:String = ""

    init(date:String, test:String, score:String) {
        self.date = date
        self.test = test
        self.score = score
    }

}
