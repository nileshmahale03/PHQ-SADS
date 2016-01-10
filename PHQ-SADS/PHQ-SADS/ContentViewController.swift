//
//  ContentViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/9/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
  
    @IBOutlet weak var titleLabel: UILabel!
    
    var pageIndex: Int!
    var titleText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = self.titleText
    }

}
